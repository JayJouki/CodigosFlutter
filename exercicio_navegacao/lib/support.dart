// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:exercicio_navegacao/heroi.dart';
import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  List<Heroi> listaheroi = [];
  Support(this.listaheroi, {super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                Image.asset("assets/images/Mercy.png", width: 190, height: 190),
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
                  Image.asset("assets/images/Lucio.png", width: 190, height: 190),
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
                Image.asset("assets/images/Zen.png", width: 190, height: 190),
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