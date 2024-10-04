// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, avoid_print
import 'package:flutter/material.dart';

import 'leitor.dart';

class MyFormluario extends StatefulWidget {
  const MyFormluario({super.key});

  @override
  State<MyFormluario> createState() => _MyFormluarioState();
}

class _MyFormluarioState extends State<MyFormluario> {
  
  List<Leitor> listaLeitor = [];

  TextEditingController controladorTexto = TextEditingController();
  String textoDigitado = "";

  TextEditingController controladorTexto2 = TextEditingController();
  String textoDigitado2 = "";

  String tipoLivro = "";
  bool romanceSelecionado = false;
  bool suspenseSelecionado = false;
  bool naoFiccaoSelecionado = false;
  bool notificacao = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de Leitura", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(child: Column(children: [
          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Image.asset("assets/images/livros.png", height: 200, width: 200)
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: TextField(
            controller: controladorTexto,
            decoration: InputDecoration(
              labelText: "Nome",
              icon: Icon(Icons.face),
              border: UnderlineInputBorder(),
            ),
            style: TextStyle(fontSize: 20),
          ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: TextField(
            controller: controladorTexto2,
            decoration: InputDecoration(
              labelText:  "Email",
              icon: Icon(Icons.email),
              border: UnderlineInputBorder(),
            ),
            style: TextStyle(fontSize: 20),
          ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Text("Tipo de livro:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Livro físico"),
              Radio(value: "Livro físico", groupValue: tipoLivro, onChanged: (value) {
                tipoLivro = value!;
                setState((){});
              }),
              SizedBox(width: 50),
              Text("Ebook"),
              Radio(value: "Ebook", groupValue: tipoLivro, onChanged: (value) {
                tipoLivro = value!;
                setState((){});
              }),
            ], 
          ),
          Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Text("Gêneros de Interesse: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          CheckboxListTile(
          title: Text("Romances"),
          subtitle: Text("Livros com histórias grandes e bem desenvolvidadas"),
          secondary: Icon(Icons.heart_broken),
          value: romanceSelecionado,
          onChanged: (value){
            romanceSelecionado = value!;
            setState((){});
          }
          ),
          CheckboxListTile(
          title: Text("Suspense"),
          subtitle: Text("Livros com tramas misteriosas e enigmáticas"),
          secondary: Icon(Icons.remove_red_eye),
          value: suspenseSelecionado,
          onChanged: (value){
            suspenseSelecionado = value!;
            setState((){});
          }
          ),
          CheckboxListTile(
          title: Text("Não-Ficcção"),
          subtitle: Text("Livros com histórias reais de pessoas reais"),
          secondary: Icon(Icons.person),
          value: naoFiccaoSelecionado,
          onChanged: (value){
            naoFiccaoSelecionado = value!;
            setState((){});
          }
          ),
          Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
            thickness: 2,
          ),
          SwitchListTile(
          title: Text("Deseja receber notificações por email?"),
          subtitle: Text("Você irá ficar por dentro das novidades!"),
          secondary: Icon(Icons.question_mark_rounded),
          activeColor: Colors.blue,
          value: notificacao,
          onChanged: (value) {
            notificacao = value;
            setState((){});
          }
        ),
        Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
            thickness: 2,
          ),
         Padding(padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    textoDigitado = controladorTexto.text;
                    textoDigitado2 = controladorTexto2.text;
                    cadastrar();
                    limpar();
                    setState(() {});
                    mostrar();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    minimumSize: Size(double.infinity, 50), 
                    backgroundColor: Colors.blue,
                  ),
                  child: Text("Enviar", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              SizedBox(width: 60),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    limpar();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    minimumSize: Size(double.infinity, 50), 
                    backgroundColor: Colors.blue,
                  ),
                  child: Text("Cancelar", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          )),
        ],)),
      ),
    );
  }

  void limpar(){
    textoDigitado = "";
    textoDigitado2 = "";
    controladorTexto.text = "";
    controladorTexto2.text = "";
    tipoLivro = "";
    romanceSelecionado = false;
    suspenseSelecionado = false;
    naoFiccaoSelecionado = false;
    notificacao = false;
  }

  void cadastrar(){
    String nome = textoDigitado;
    String email = textoDigitado2;
    List<String> listaIn = [];
    if (romanceSelecionado == true){
      listaIn.add("Romance");
    }
    if (naoFiccaoSelecionado == true){
      listaIn.add("Não-Ficção");
    }
    if (suspenseSelecionado == true){
      listaIn.add("Suspense");
    }
    Leitor l = Leitor(nome,email,notificacao,tipoLivro,listaIn);
    listaLeitor.add(l);
  }

  void mostrar(){
    listaLeitor.forEach((Leitor l) {
      print("==========");
      print("Nome: " + l.nome);
      print("E-mail: " + l.email);
      print("Tipo de Livro: " + l.tipoLivro);
      l.listaInteresses.forEach((String s) {
      print("Interesse: " + s);
      });
      print("Notificações: " + l.notificacao.toString());
    });
  }

}