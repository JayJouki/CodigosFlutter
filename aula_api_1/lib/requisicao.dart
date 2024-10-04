// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aula_api_1/tarefa.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyRequisicao extends StatefulWidget {
  const MyRequisicao({super.key});

  @override
  State<MyRequisicao> createState() => _MyRequisicaoState();
}

class _MyRequisicaoState extends State<MyRequisicao> {

  TextEditingController idController = TextEditingController();

  String dadosAPI = "";
  //var userId;
  //var taskId;
  //var title;
  //var completed;
  Tarefa minhaTarefa = Tarefa();

  Future<void> fazerRequisicao() async{

    var url = Uri.parse("https://jsonplaceholder.typicode.com/todos/" + idController.text);
    http.Response resposta;
    resposta = await http.get(url);
    dadosAPI = resposta.body;
    if(resposta.statusCode==200){
      Map<String, dynamic> dadosFormatados = jsonDecode(resposta.body);
      minhaTarefa = Tarefa.fromJson(dadosFormatados);
      /*userId = (dadosFormatados['userId']);
      taskId = (dadosFormatados['id']);
      title = (dadosFormatados['title']);
      completed = (dadosFormatados['completed']);*/
      
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo Requisição API"),
        backgroundColor: Colors.amber,
      ),
      body: Center(child: Column(children: [
        Text('Digite o Id que deseja buscar'),
        Padding(padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: idController,
                  decoration: InputDecoration(labelText: "Id", icon: Icon(Icons.format_list_numbered)),
                  )
                ),
        ElevatedButton(onPressed: (){
          
            fazerRequisicao();
          
          
        }, child: Text("Fazer requsição")),
        Text('ID do usuário: ' + minhaTarefa.idUsuario.toString()),
        Text('ID da tarefa: ' + minhaTarefa.idTarefa.toString()),
        Text('Título da tarefa: ' + minhaTarefa.titulo.toString()),
        Text('Completa? ' + minhaTarefa.completa.toString()),
      ])),
    );
  }
}
