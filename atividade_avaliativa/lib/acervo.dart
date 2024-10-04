import 'package:atividade_avaliativa/livro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class Acervo extends StatefulWidget {
  List<Livro> listaL = [];
  Acervo(this.listaL, {super.key});

  @override
  State<Acervo> createState() => _AcervoState();
}

class _AcervoState extends State<Acervo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acervo Literário", style: TextStyle( fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      //
      body: Center(child: Column(children: [
        SizedBox(height: 560, child:
        ListView.separated(
                separatorBuilder: (context, index) => Divider(thickness: 2),
                itemCount: widget.listaL.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(radius: 25, backgroundImage: AssetImage("assets/images/livroaberto.png")),
                    title: Text(widget.listaL[index].nome + " - " + widget.listaL[index].escritor) ,
                    subtitle: Text(widget.listaL[index].descricao),
                    trailing: Text(widget.listaL[index].genero),
                  );
                },
              ),
        ),
        
        Padding(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
            Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0)),
            minimumSize: Size(double.infinity, 50), 
            backgroundColor: Colors.amber,
            ),
          child: Text("Voltar", style: TextStyle( color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),           
        ),
      ])) 
    );
  }
}