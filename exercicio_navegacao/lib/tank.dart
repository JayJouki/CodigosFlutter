// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:exercicio_navegacao/heroi.dart';
import 'package:flutter/material.dart';

class Tank extends StatefulWidget {
  List<Heroi> listaheroi = [];
  Tank(this.listaheroi, {super.key});

  @override
  State<Tank> createState() => _TankState();
}

class _TankState extends State<Tank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tank", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
          },
          icon: Icon(Icons.home)
          )]
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Rein.png", width: 190, height: 190),
                Expanded(
                  child: Column(children: [
                    Text(widget.listaheroi[0].nome, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(widget.listaheroi[0].desc, style: TextStyle(fontWeight: FontWeight.bold))
                  ]))
              ])
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Ram.png", width: 190, height: 190),
                  Expanded(
                    child: Column(
                      children: [
                        Text(widget.listaheroi[1].nome, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(widget.listaheroi[1].desc, style: TextStyle(fontWeight: FontWeight.bold))
                      ]))
                ])
              ),
              SizedBox(height: 50),
            Padding(padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Doom.png", width: 190, height: 190),
                Expanded(
                  child: Column(children: [
                    Text(widget.listaheroi[2].nome, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(widget.listaheroi[2].desc, style: TextStyle(fontWeight: FontWeight.bold))
                  ]))
              ])
            ),
      ])),
    );
  }
}