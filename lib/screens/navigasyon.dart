import 'package:evcilhayvan/services/geolocator_service.dart';
import 'package:evcilhayvan/services/places_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var currentPosition;
  List placesProvider = [];
  List geometry = [];
  late GoogleMapController mapController;
  bool isloading = false;
  final Set<Marker> markers = new Set();

  Set<Marker> getmarkers() {
    try {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          new CameraPosition(
              target:
                  LatLng(currentPosition.latitude, currentPosition.longitude),
              tilt: 0,
              zoom: 10.00),
        ),
      );
      markers.add(Marker(
        //İlk işaretçi
        markerId: MarkerId('1'),
        position: LatLng(currentPosition.latitude,
            currentPosition.longitude), //Pozisyon için marker

        icon: BitmapDescriptor.defaultMarker, //İşaretçi için marker
      ));
    } catch (e) {
      print(e);
    }
    print('Konum 2$markers');
    return markers;
  }

  getlocation() async {
    print("Burdayım");
    setState(() {
      isloading = true;
    });
    await GeoLocatorService().getLocation().then((value) => {
          if (value != null)
            {
              setState(() {
                currentPosition = value;
                print("Burdayım ${currentPosition.latitude}");
              }),
            }
          else
            {null}
        });

    await PlacesService()
        .getPlaces(currentPosition.latitude, currentPosition.longitude)
        .then((value) => {
              setState(() {
                placesProvider = value;
                for (int i = 0; i < placesProvider.length; i++) {
                  geometry.add(value[i]['geometry']['location']);
                  print('Konum $geometry');
                }
                //  print("Burdayım ${geometry}");
              })
            });
    // await getmarkers();
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getlocation();
  }

  @override
  Widget build(BuildContext context) {
    // final currentPosition = Provider.of<Position>(context);
    // final placesProvider = Provider.of<Future<List<Place>>>(context);

    return isloading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: (currentPosition != null)
                ? Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                              target: LatLng(currentPosition.latitude,
                                  currentPosition.longitude),
                              zoom: 16.0),
                          zoomGesturesEnabled: true,
                          mapType: MapType.normal,
                          markers: getmarkers(),
                          onMapCreated: (controller) {
                            //Harita oluşturma yeri
                            setState(() {
                              mapController = controller;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: placesProvider.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  title: Text(placesProvider[index]['name']),
                                ),
                              );
                            }),
                      )
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          );
  }
}
