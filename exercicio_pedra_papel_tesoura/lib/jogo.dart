// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';

class MyJogo extends StatefulWidget {
  const MyJogo({super.key});

  @override
  State<MyJogo> createState() => _MyJogoState();
}

class _MyJogoState extends State<MyJogo> {

  String escolhaAppImagem = "assets/images/pedra.png";
  String escolhaAppTexto = "O App ainda não escolheu";
  String escolhaUsuario = "";
  String escolhaUsuarioTexto = "Você ainda não escolheu";
  String resultado = "Jogo não começou";


  void escolhaApp(){
    int numero = Random().nextInt(3);
    switch(numero){
      case 0:
        escolhaAppImagem = "assets/images/pedra.png";
        escolhaAppTexto = "O App escolheu pedra!";
      break;
      case 1:
        escolhaAppImagem = "assets/images/papel.png";
        escolhaAppTexto = "O App escolheu papel!";
      break;
      case 2:
        escolhaAppImagem = "assets/images/tesoura.png";
        escolhaAppTexto = "O App escolheu tesoura!";
      break;
      default:
        escolhaAppImagem = "assets/images/pedra.png";
        escolhaAppTexto = "O App escolheu pedra!";
      break;
    }
  }

  void jogo(){
    if (
        (escolhaUsuario == "pedra" && escolhaAppImagem == "assets/images/tesoura.png") ||
        (escolhaUsuario == "tesoura" && escolhaAppImagem == "assets/images/papel.png") ||
        (escolhaUsuario == "papel" && escolhaAppImagem == "assets/images/pedra.png")
    ){
      resultado = "Você venceu!";
    } else if (
        (escolhaAppImagem == "assets/images/pedra.png" && escolhaUsuario == "tesoura") ||
        (escolhaAppImagem == "assets/images/tesoura.png" && escolhaUsuario == "papel") ||
        (escolhaAppImagem == "assets/images/papel.png" && escolhaUsuario == "pedra")
    ){
      resultado = "Você perdeu...";
    } else {
      resultado = "O jogo empatou!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Pedra, Papel, Tesoura", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: SizedBox(child: Image.asset(escolhaAppImagem, width: 100, height: 100,)),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Text(escolhaAppTexto, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text("Escolha uma opção:", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      escolhaUsuario = "pedra";
                      escolhaUsuarioTexto = "Você escolheu pedra";
                      escolhaApp();
                      jogo();
                      setState((){});
                    },
                    child: Image.asset("assets/images/pedra.png", height: 100, width: 100),
                  ),
                  GestureDetector(
                    onTap: (){
                      escolhaUsuario = "papel";
                      escolhaUsuarioTexto = "Você escolheu papel";
                      escolhaApp();
                      jogo();
                      setState((){});
                    },
                    child: Image.asset("assets/images/papel.png", height: 100, width: 100),
                  ),
                  GestureDetector(
                    onTap: (){
                      escolhaUsuario = "tesoura";
                      escolhaUsuarioTexto = "Você escolheu tesoura";
                      escolhaApp();
                      jogo();
                      setState((){});
                    },
                    child: Image.asset("assets/images/tesoura.png", height: 100, width: 100),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(escolhaUsuarioTexto, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: Text(resultado, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      )
    );
  }
}