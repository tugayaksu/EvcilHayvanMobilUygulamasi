import 'package:flutter/material.dart';

class HayvanDetay extends StatelessWidget {
  final String isim;
  final String resimYolu;
  final String aciklama;
  final String aciklama2;
  final String aciklama3;
  final String aciklama4;
  final String aciklama5;
  final String aciklama6;
  final String aciklama7;
  final String aciklama8;
  const HayvanDetay({
    Key? key,
    required this.isim,
    required this.resimYolu,
    required this.aciklama,
    required this.aciklama2,
    required this.aciklama3,
    required this.aciklama4,
    required this.aciklama5,
    required this.aciklama6,
    required this.aciklama7,
    required this.aciklama8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
          Stack(
            children: [
              Hero(
                tag: resimYolu,
                child: Image.network(
                  resimYolu,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.red,
                  size: 40.0,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Text(
                isim,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: Text(
                  aciklama,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: Text(
                  aciklama2,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: Text(
                  aciklama3,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: Text(
                  aciklama4,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: Text(
                  aciklama5,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: Text(
                  aciklama6,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: Text(
                  aciklama7,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: Text(
                  aciklama8,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
