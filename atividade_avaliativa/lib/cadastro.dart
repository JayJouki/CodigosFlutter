import 'package:atividade_avaliativa/acervo.dart';
import 'package:atividade_avaliativa/livro.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  GlobalKey<FormState> validationKey = GlobalKey();
  TextEditingController nomeController = TextEditingController();
  TextEditingController escritorController = TextEditingController();
  TextEditingController generoController = TextEditingController();
  TextEditingController descController = TextEditingController();

  List<Livro> listaLivros = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acervo Literário", style: TextStyle( fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.amber,
         actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Acervo(listaLivros)));
          },
          icon: Icon(Icons.menu_book_outlined)
          )
        ]
      ),
      body: 
      SingleChildScrollView(
        child: Center(
          child: Form(
            key: validationKey,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(5),
                child: Image.asset("assets/images/livros.png", width: 250, height: 250)
                ),
                Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Text("Cadastro de Livros", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                Padding(padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: nomeController,
                  decoration: InputDecoration(labelText: "Nome do Livro", icon: Icon(Icons.menu_book_rounded)),
                  validator: (value) {
                    if (value!.isEmpty){
                      return "Nome não pode ser vazio!";
                    } 
                    return null;
                  })
                ),
                Padding(padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: escritorController,
                  decoration: InputDecoration(labelText: "Escritor", icon: Icon(Icons.person)),
                  validator: (value) {
                    if (value!.isEmpty){
                      return "Nome do escritor não pode ser vazio!";
                    } 
                    return null;
                  })
                ),
                Padding(padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: generoController,
                  decoration: InputDecoration(labelText: "Gênero do Livro", icon: Icon(Icons.bookmark)),
                  validator: (value) {
                    if (value!.isEmpty){
                      return "Gênero não pode ser vazio!";
                    } 
                    return null;
                  })
                ),
                Padding(padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: descController,
                  decoration: InputDecoration(labelText: "Descrição", icon: Icon(Icons.my_library_books_rounded)),
                  validator: (value) {
                    if (value!.isEmpty){
                      return "Descrição não pode ser vazia!";
                    } 
                    return null;
                  })
                ),
                
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
                            } else {
                              showDialog(context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Text("Erro!"),
                                    content: Text("Campos Inválidos!"),
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
                            backgroundColor: Colors.amber,
                          ),
                          child: Text("Cadastrar", style: TextStyle(color: Colors.white, fontSize: 16)),
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
                            backgroundColor: Colors.amber,
                          ),
                          child: Text("Limpar", style: TextStyle(color: Colors.white, fontSize: 16)),
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
    Livro l = Livro(nomeController.text, escritorController.text, generoController.text, descController.text);
    listaLivros.add(l);
    limpar();
  }

  void limpar(){
    nomeController.text = "";
    escritorController.text = "";
    generoController.text = "";
    descController.text = "";
  }

    void mostrarMsgSucesso(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Livro cadastrado com sucesso!"))
    );  
  }

}