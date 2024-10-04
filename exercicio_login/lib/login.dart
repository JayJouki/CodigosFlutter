// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';

import 'usuario.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  GlobalKey<FormState> validationKey = GlobalKey();
  TextEditingController nomeController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  bool existe = false;

  List<Usuario> listaUser = [Usuario("João", "1234"), Usuario("Tânia", "5678")];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Form(
        key: validationKey,
        child: Column(children: [
        Padding(padding: EdgeInsets.all(10),
        child: Image.asset("assets/images/lock.png", width: 50, height: 50)
        ),
        Padding(padding: EdgeInsets.all(10),
        child: Text("Login", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        Divider(),
        Padding(padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: nomeController,
            decoration: InputDecoration(labelText: "Nome de Usuário", icon: Icon(Icons.person)),
            validator: (value) {
              if (value!.isEmpty){
                return "Nome não pode ser vazio!";
              } 
              return null;
            },
        )),
        Padding(padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: senhaController,
          obscureText: true,
            decoration: InputDecoration(labelText: "Senha", icon: Icon(Icons.remove_red_eye)),
            validator: (value) {
              if (value!.isEmpty){
                return "Senha não pode ser vazia!";
              } else if (value.length < 3){ 
                return "Senha deve ter pelo menos 3 caracteres!";
              }
              return null;
            },
        )),
        Padding(padding: EdgeInsets.all(10),
        child: ElevatedButton(

                  onPressed: () {
                    if (validationKey.currentState!.validate()){
                      verificar();
                      if (existe == true){
                        mostrarMsgSucesso();
                      } else {
                        showDialog(context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text("Erro!"),
                            content: Text("Usúario ou senha incorretos!"),
                            actions: <Widget>[
                              TextButton(
                              child: Text("Fechar"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ],
                          );
                        });
                      }
                      limpar();
                      setState(() {});
                      existe = false;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ), 
                    backgroundColor: Colors.black,
                  ),
                  child: Text("Entrar", style: TextStyle(color: Colors.white, fontSize: 16)),
                ))
      ]))),
    );
  }

  void limpar(){
    nomeController.text = "";
    senhaController.text = "";
  }

  void mostrarMsgSucesso(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Logado com sucesso!"))
    );  
  }

  void verificar(){
    listaUser.forEach((Usuario u) {
      if ((u.nome == nomeController.text) && (u.senha == senhaController.text)){
        existe = true;
      }
    });
  }
}