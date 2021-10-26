import 'package:evcilhayvan/hayvanlar.dart';
import 'package:evcilhayvan/screens/navigasyon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evcil Hayvan Proje',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  late List _icerikler;
  int _aktifIcerikNo = 0;

  @override
  void initState() {
    super.initState();
    _icerikler = [
      Hayvanlar(),
      Search(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red.shade400,
        ),
        elevation: 0.0,
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        title: const Text(
          "Evcil Hayvan Bilgilendirme",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: _icerikler[_aktifIcerikNo],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade200,
        currentIndex: _aktifIcerikNo,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text("Anasayfa"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
            ),
            title: Text("Harita"),
          ),
        ],
        onTap: (int tiklananPozisyonNo) {
          setState(() {
            _aktifIcerikNo = tiklananPozisyonNo;
          });
        },
      ),
    );
  }
}
