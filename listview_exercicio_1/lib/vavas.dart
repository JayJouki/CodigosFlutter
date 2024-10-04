import 'package:flutter/material.dart';

import 'agente.dart';

class Vavas extends StatefulWidget {
  const Vavas({super.key});

  @override
  State<Vavas> createState() => _VavasState();
}

class _VavasState extends State<Vavas> {

  List<Agente> listaV =[
    Agente("Cypher", "Sentinela", "Quero um cadáver...", "assets/images/cypher.png"),
    Agente("Gekko", "Iniciador", "Planta a spike, Wingman!", "assets/images/gekko.png"),
    Agente("Iso", "Duelista", "Só eu e você...", "assets/images/iso.png"),
    Agente("Clove", "Controlador", "Olha a fumacinha!!", "assets/images/clove.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Valorant"), centerTitle: true, backgroundColor: const Color.fromARGB(255, 255, 17, 0),
      ),
      
      body: Center(child: Column(children: [
        SizedBox(height: 400, child:
        ListView.separated(
                separatorBuilder: (context, index) => Divider(thickness: 2),
                itemCount: listaV.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(radius: 28, backgroundImage: AssetImage(listaV[index].foto)),
                    title: Text(listaV[index].nome),
                    subtitle: Text(listaV[index].frase),
                    trailing: Text(listaV[index].classe),
                  );
                },
              ),
        ),
        
        ElevatedButton(onPressed: (){}, child: Text("Voltar")),
      ])) 
    );
  }
}