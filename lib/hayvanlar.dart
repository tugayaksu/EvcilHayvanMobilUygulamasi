import 'package:flutter/material.dart';
import 'hayvankategorileri.dart';

class Hayvanlar extends StatefulWidget {
  const Hayvanlar({Key? key}) : super(key: key);

  @override
  _HayvanlarState createState() => _HayvanlarState();
}

class _HayvanlarState extends State<Hayvanlar>
    with SingleTickerProviderStateMixin {
  late TabController hayvanKontrolcusu;

  @override
  void initState() {
    super.initState();
    hayvanKontrolcusu = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: hayvanKontrolcusu,
          indicatorColor: Colors.red.shade400,
          labelColor: Colors.red.shade400,
          unselectedLabelColor: Colors.black,
          isScrollable: true,
          labelStyle: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
          tabs: [
            Tab(
              child: Text("Memeli Evcil Hayvanlar"),
            ),
            Tab(
              child: Text("Evcil Kuşlar"),
            ),
            Tab(
              child: Text("Evcil Sürüngenler"),
            ),
            Tab(
              child: Text("Evcil Amfibyumlar"),
            ),
            Tab(
              child: Text("Evcil Böcekler"),
            ),
            Tab(
              child: Text("Evcil Balıklar"),
            ),
            Tab(
              child: Text("Evcil Eklembacaklılar"),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: hayvanKontrolcusu,
            children: [
              HayvanKategorileri(
                kategori: "memeli evcil hayvanlar",
              ),
              HayvanKategorileri(
                kategori: "evcil kuşlar",
              ),
              HayvanKategorileri(
                kategori: "evcil sürüngenler",
              ),
              HayvanKategorileri(
                kategori: "evcil amfibyumlar",
              ),
              HayvanKategorileri(
                kategori: "evcil böcekler",
              ),
              HayvanKategorileri(
                kategori: "evcil balıklar",
              ),
              HayvanKategorileri(
                kategori: "evcil eklembacaklılar",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
