// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print

import 'package:flutter/material.dart';

class MyValidation extends StatefulWidget {
  const MyValidation({super.key});

  @override
  State<MyValidation> createState() => _MyValidationState();
}

class _MyValidationState extends State<MyValidation> {
  GlobalKey<FormState> chaveValidation = GlobalKey();
  TextEditingController raController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Form(
        key: chaveValidation,
        child: Column(children: [
          TextFormField(
            controller: raController,
            decoration: InputDecoration(labelText: "RA"),
            validator: (value) {
              if (value!.isEmpty){
                return "RA não pode ser vazio!";
              } else if (int.parse(raController.text) < 10){
                return "RA deve ser maior que 10!";
              }
              return null;
            },
          ),
          TextFormField(
            controller: nomeController,
            decoration: InputDecoration(labelText: "Nome"),
            validator: (value) {
              if (value!.isEmpty){
                return "Nome não pode ser vazio!";
              } else if (value.length < 3){
                return "Nome deve ter pelos menos 3 caracteres!";
              }
              return null;
            },
          ),
          ElevatedButton(onPressed: () {
            if (chaveValidation.currentState!.validate()){
              print(nomeController.text + " " + raController.text.toString());
            }
          }, child: Text("Cadastrar"))
      ])))
    );
  }
}