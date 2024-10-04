// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, must_be_immutable

import 'package:flutter/material.dart';

class Favorito extends StatefulWidget {
  List<String> lista = [];
  Favorito(this.lista, {super.key});

  @override
  State<Favorito> createState() => _FavoritoState();
}

class _FavoritoState extends State<Favorito> {
  String palavrasDaLista = "";
  @override
  Widget build(BuildContext context) {
    mostrar();
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorito"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(child: Column(children: [
        Text(palavrasDaLista),
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
          //Navigator.pushNamed(context, '/');
        },
        child: Text("Voltar"))
        ])) 
    );
  }

void mostrar(){
  for(int i = 0; i < widget.lista.length; i++){
    palavrasDaLista = palavrasDaLista + widget.lista[i] + " ";
  }
}

}