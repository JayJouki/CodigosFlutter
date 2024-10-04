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
  String tipoBusca = "";
  String dadosAPI = "";

  String texto1 = "";
  String texto2 = "";
  String texto3 = "";
  String texto4 = "";
  String texto5 = "";

  var result1 = "";
  var result2 = "";
  var result3 = "";
  var result4 = "";
  var result5 = "";

  Future<void> fazerRequisicao() async{

    var url;
    if(tipoBusca == "people"){
      url = Uri.parse("https://swapi.dev/api/people/" + idController.text + "/");
    } else if (tipoBusca == "planets"){
      url = Uri.parse("https://swapi.dev/api/planets/" + idController.text + "/");
    } else if(tipoBusca == "starships"){
      url = Uri.parse("https://swapi.dev/api/starships/" + idController.text + "/");
    }
    http.Response resposta;
    resposta = await http.get(url);
    dadosAPI = resposta.body;
    if(resposta.statusCode==200){
      Map<String, dynamic> dadosFormatados = jsonDecode(resposta.body);
      if(tipoBusca == "people"){
        result1 = (dadosFormatados['birth_year']);
        texto1 = "Ano de nascimento: ";
        result2 = (dadosFormatados['eye_color']);
        texto2 = "Cor do olho: ";
        result3 = (dadosFormatados['name']);
        texto3 = "Nome: ";
        result4 = (dadosFormatados['gender']);
        texto4 = "Gênero: ";
        result5 = (dadosFormatados['hair_color']);
        texto5 = "Cor do cabelo: ";
      } else if (tipoBusca == "starships"){
        result1 = (dadosFormatados['name']);
        texto1 = "Nome: ";
        result2 = (dadosFormatados['cargo_capacity']);
        texto2 = "Capacidade de carga: ";
        result3 = (dadosFormatados['hyperdrive_rating']);
        texto3 = "Taxa de hiperespaço: ";
        result4 = (dadosFormatados['cost_in_credits']);
        texto4 = "Custo em créditos: ";
        result5 = (dadosFormatados['passengers']);
        texto5 = "Passageiros: ";
      } else if(tipoBusca == "planets"){
        result1 = (dadosFormatados['name']);
        texto1 = "Nome: ";
        result2 = (dadosFormatados['population']);
        texto2 = "População: ";
        result3 = (dadosFormatados['diameter']);
        texto3 = "Diâmetro: ";
        result4 = (dadosFormatados['terrain']);
        texto4 = "Terreno: ";
        result5 = (dadosFormatados['gravity']);
        texto5 = "Gravidade: ";
      }

      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requisição SWAPI"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(child: Column(children: [
        Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Text("Tipo de busca:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Personagem"),
              Radio(value: "people", groupValue: tipoBusca, onChanged: (value) {
                tipoBusca = value!;
                setState((){});
              }),
              SizedBox(width: 25),
              Text("Planeta"),
              Radio(value: "planets", groupValue: tipoBusca, onChanged: (value) {
                tipoBusca = value!;
                setState((){});
              }),
              SizedBox(width: 25),
              Text("Nave"),
              Radio(value: "starships", groupValue: tipoBusca, onChanged: (value) {
                tipoBusca = value!;
                setState((){});
              }),
            ], 
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: TextFormField(
                  controller: idController,
                  decoration: InputDecoration(labelText: "Id", icon: Icon(Icons.format_list_numbered)),
                  )
          ),
        
            ElevatedButton(
                  onPressed: () {
                    fazerRequisicao();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    backgroundColor: Colors.amber,
                  ),
                  child: Text("Enviar", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
          Text(texto1 + result1.toString()),
          Text(texto2 + result2.toString()),
          Text(texto3 + result3.toString()),
          Text(texto4 + result4.toString()),
          Text(texto5 + result5.toString()),
          
      ],))
    );
  }
}