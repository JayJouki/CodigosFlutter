// ignore_for_file: prefer_const_constructors

import 'package:aula_navegacao/favorito.dart';
import 'package:aula_navegacao/pessoa.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> frasesMotivacionais = ["bora bill", "ai zé da manga", "sigma da bahia"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo Navegação"),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Pessoa("Bom dia")));
          },
          icon: Icon(Icons.person)
          ),
          IconButton(
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Favorito(frasesMotivacionais)));
          },
          icon: Icon(Icons.favorite)
          ),
        ],
      ),
      body: Center(child: Column(children: [
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, '/pessoa');
        },
        child: Text("Pessoa")),
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, '/favorito');
        },
        child: Text("Favorito"))
      ])),
    );
  }
}