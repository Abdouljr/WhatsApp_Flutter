import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/main.dart';

class Profil extends StatelessWidget {
  final String nom;
  final String image;
  const Profil({super.key, required this.nom, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(nom),
          backgroundColor: cvert,
          centerTitle: true,
        ),
        body: Image.asset(
          image,
        ));
  }
}
