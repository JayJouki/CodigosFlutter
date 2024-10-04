// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'aluno.dart';

class MyLista extends StatefulWidget {
  const MyLista({super.key});

  @override
  State<MyLista> createState() => _MyListaState();
}

class _MyListaState extends State<MyLista> {

  List<Aluno> listaAl = [
    Aluno("Roberto", 123),
    Aluno("Jackson", 456),
    Aluno("Michael", 789),
    Aluno("Maria",101),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"), backgroundColor: Colors.amber,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(thickness: 2),
        itemCount: listaAl.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text(listaAl[index].nome[0])),
            title: Text(listaAl[index].nome),
            subtitle: Text(listaAl[index].ra.toString()),
            trailing: Icon(Icons.call),
          );
        },
      ),
    );
  }
}