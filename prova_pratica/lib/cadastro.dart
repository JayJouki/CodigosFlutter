// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, avoid_function_literals_in_foreach_calls, avoid_print

import 'package:flutter/material.dart';

import 'medico.dart';

class MyCadastro extends StatefulWidget {
  const MyCadastro({super.key});

  @override
  State<MyCadastro> createState() => _MyCadastroState();
}

class _MyCadastroState extends State<MyCadastro> {
  
  GlobalKey<FormState> validationKey = GlobalKey();
  TextEditingController nomeController = TextEditingController();
  TextEditingController crmController = TextEditingController();

  bool residencia = false;
  bool especializado = false;
  bool posGraduado = false;
  bool chamadaEmergencia = false;

  List<Medico> listaMedico = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clínica Médica Albert Einstein", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: 
      SingleChildScrollView(
        child: Center(
          child: Form(
            key: validationKey,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(5),
                child: Image.asset("assets/images/medicina.png", width: 150, height: 250)
                ),
                Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Text("Dados Básicos", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                Padding(padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: nomeController,
                  decoration: InputDecoration(labelText: "Nome de Médico", icon: Icon(Icons.person)),
                  validator: (value) {
                    if (value!.isEmpty){
                      return "Nome não pode ser vazio!";
                    } 
                    return null;
                  })
                ),
                Padding(padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: crmController,
                  decoration: InputDecoration(labelText: "Nº de Registro CRM", icon: Icon(Icons.health_and_safety_outlined)),
                  validator: (value){
                    if (value!.isEmpty){
                        int numberValue = 0;
                        if (numberValue == 0){
                          return "CRM não pode ser vazio!";
                        }
                    }
                    if (int.parse(value) <= 0){
                      return "CRM não pode ser menor que zero!";
                    }
                    return null;
                  })
                ),
                Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text("Formação", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                Padding(padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: CheckboxListTile(
                  title: Text("Residência"),
                  subtitle: Text("O médico irá atender os pacientes em suas residências se necessário."),
                  secondary: Icon(Icons.house),
                  value: residencia,
                  onChanged: (value){
                    residencia = value!;
                    setState((){});
                  }
                )),
                Padding(padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: CheckboxListTile(
                  title: Text("Especialização"),
                  subtitle: Text("O médico possui especialização em alguma área."),
                  secondary: Icon(Icons.healing),
                  value: especializado,
                  onChanged: (value){
                    especializado = value!;
                    setState((){});
                  }
                )),
                Padding(padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: CheckboxListTile(
                  title: Text("Pós Graduação"),
                  subtitle: Text("O médico possui pós graduação."),
                  secondary: Icon(Icons.school),
                  value: posGraduado,
                  onChanged: (value){
                    posGraduado = value!;
                    setState((){});
                  }
                )),
                Padding(padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: SwitchListTile(
                  title: Text("Permitir chamadas de emergência?"),
                  subtitle: Text("O médico poderá atender chamadas de emergência."),
                  secondary: Icon(Icons.phone),
                  activeColor: Colors.green,
                  value: chamadaEmergencia,
                  onChanged: (value) {
                    chamadaEmergencia = value;
                    setState((){});
                  }
                )),
                Padding(padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (validationKey.currentState!.validate()){
                            cadastro();
                            setState(() {});
                            mostrarMsgSucesso();
                            mostrar();
                            } else {
                              showDialog(context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Text("Erro!"),
                                    content: Text("Nome ou CRM Inválidos!"),
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
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            minimumSize: Size(double.infinity, 50), 
                            backgroundColor: Colors.green,
                          ),
                          child: Text("Casdastrar", style: TextStyle(color: Colors.white, fontSize: 16)),
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
                            backgroundColor: Colors.green,
                          ),
                          child: Text("Cancelar", style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ),
                    ],
                  )),
              ]
            )
          )
        )
      ),
    );
  }

  void cadastro(){
    List<bool> listaFormacao = [residencia, especializado, posGraduado];
    Medico m = Medico(nomeController.text, int.parse(crmController.text), listaFormacao, chamadaEmergencia);
    listaMedico.add(m);
    limpar();
  }

  void limpar(){
    nomeController.text = "";
    crmController.text = "";
    residencia = false;
    especializado = false;
    posGraduado = false;
    chamadaEmergencia = false;
  }

  void mostrar(){
    listaMedico.forEach((Medico m) {
      print("==========");
      print("Nome: " + m.nome);
      print("CRM: " + m.crm.toString());
      print("Residência: " + m.formacao[0].toString());
      print("Especialização: " + m.formacao[1].toString());
      print("Pós Graduação: " + m.formacao[2].toString());
      print("Emergência: " + m.emergencia.toString());
    });
  }

    void mostrarMsgSucesso(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Médico cadastrado com sucesso!"))
    );  
  }
}