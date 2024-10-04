import 'package:exercicio_api_json/busca.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyRequisicao extends StatefulWidget {
  const MyRequisicao({super.key});

  @override
  State<MyRequisicao> createState() => _MyRequisicaoState();
}

class _MyRequisicaoState extends State<MyRequisicao> {
  TextEditingController cepController = TextEditingController();
  String dadosAPI = "";
  Busca minhaBusca = Busca();
  String errorMessage = "";

  Future<void> fazerRequisicao() async {
    var url = Uri.parse("http://viacep.com.br/ws/" + cepController.text + "/json/");
    http.Response resposta;
    resposta = await http.get(url);
    dadosAPI = resposta.body;
    if (resposta.statusCode == 200) {
      Map<String, dynamic> dadosFormatados = jsonDecode(resposta.body);
      minhaBusca = Busca.fromJson(dadosFormatados);
      setState(() {});
    }
  }

  void validarCEP() {
    String cep = cepController.text;
    if (cep.isEmpty) {
      setState(() {
        errorMessage = "O campo não pode estar vazio!";
      });
    } else if (cep.length != 8) {
      setState(() {
        errorMessage = "O CEP deve conter exatamente 8 caracteres!";
      });
    } else {
      setState(() {
        errorMessage = ""; // Limpa a mensagem de erro se estiver tudo certo
      });
      fazerRequisicao(); // Se a validação passar, faz a requisição
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API - Busca de CEP"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                'Digite o CEP que deseja buscar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 80, 10),
              child: TextFormField(
                controller: cepController,
                decoration: InputDecoration(
                  labelText: "CEP",
                  icon: Icon(Icons.location_on_outlined),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ElevatedButton(
                onPressed: () {
                  validarCEP();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  backgroundColor: Colors.amber,
                ),
                child: Text("Enviar", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            if (errorMessage.isNotEmpty) // Exibe a mensagem de erro se houver
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CEP: ${minhaBusca.cep}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Logradouro: ${minhaBusca.logradouro}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Complemento: ${minhaBusca.complemento}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Bairro: ${minhaBusca.bairro}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Localidade: ${minhaBusca.localidade}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

