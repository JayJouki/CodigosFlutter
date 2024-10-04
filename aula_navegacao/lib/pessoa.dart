// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class Pessoa extends StatefulWidget {
  String frase = "";
  Pessoa(this.frase, {super.key});

  @override
  State<Pessoa> createState() => _PessoaState();
}

class _PessoaState extends State<Pessoa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pessoa"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Text(widget.frase),
    );
  }
}