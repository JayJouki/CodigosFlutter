// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyTela extends StatelessWidget {
  const MyTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem Vindo(a)", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 221, 24, 6),    
        centerTitle: true,
      ),
      body: Center(child: Column(children: [
        SizedBox(
              child: Image.asset('assets/images/boasvindas.jpeg'),
            ),
      SizedBox(height: 20),
       Text("Bem Vindo(a) à aula de desenvolvimento de aplicações para dispositivos móveis", style: TextStyle(fontSize: 17), textAlign: TextAlign.center,),
       SizedBox(height: 20),
       Text("Aqui você vai encontrar: ", style: TextStyle(fontSize: 12), textAlign: TextAlign.center,),
       SizedBox(height: 20),
      Container(padding: EdgeInsets.fromLTRB(120, 0, 60, 0), child: Column(children: [
Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Icon(Icons.check_circle_outline_outlined, color: Colors.green),
      Text("Conceitos báscios da linguagem dart", style: TextStyle(fontSize: 12))
     ],
        ),
        SizedBox(height: 10),
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Icon(Icons.check_circle_outline_outlined, color: Colors.green),
      Text("Stateless e Stateful widgets", style: TextStyle(fontSize: 12))
     ],
        ),
        SizedBox(height: 10),
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Icon(Icons.check_circle_outline_outlined, color: Colors.green),
      Text("Exemplos práticos", style: TextStyle(fontSize: 12))
    ],
        ),
      ],)),
      
      ]
      ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 221, 24, 6),
        height: 40,
        child: Text("Venha estudar conosco!", 
          style: TextStyle(
            color: Colors.white,
            fontSize: 15
          ),
          textAlign: TextAlign.center
        )
      ),

    );
  }
}