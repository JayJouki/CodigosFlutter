// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exercicio_navegacao/dps.dart';
import 'package:exercicio_navegacao/heroi.dart';
import 'package:exercicio_navegacao/support.dart';
import 'package:exercicio_navegacao/tank.dart';
import 'package:flutter/material.dart';

class Overwatch extends StatefulWidget {
  const Overwatch({super.key});

  @override
  State<Overwatch> createState() => _OverwatchState();
}

class _OverwatchState extends State<Overwatch> {

  List<Heroi> listaTank = [Heroi("Reinhardt", "Reinhardt Wilhelm vive pelos nobres códigos da bravura, da justiça e da coragem. Um dos fundadores da Overwatch, por décadas foi uma força do bem pelo mundo todo. Depois da queda da organização, ele viajou pela Europa como um cavaleiro de antigamente, defendendo os inocentes ao lado de sua escudeira, Brigitte, até que Winston os chamou de volta para servir a Overwatch."),
  Heroi("Ramattra", "Ramattra não foi feito para coexistir com a humanidade. O ômnico da série Devastadora foi construído no início da Crise Ômnica como parte da classe de ômnicos de comando, cuja função era guiar unidades em combate e adaptar vários protocolos estratégicos às mudanças nas condições do campo de batalha."),
  Heroi("Doomfist", "Um lutador exímio e líder nato, Akande Ogundimu perdeu o braço direito durante a Crise Ômnica e depois se uniu à Talon. Galgando escalões, ele matou seu chefe, o Doomfist anterior, e tomou a arma e título de mesmo nome. Agora, está determinado a lançar o mundo em um novo conflito por seus próprios fins misteriosos.")];
  List<Heroi> listaDPS = [Heroi("Genji", "À beira da morte pelas mãos do próprio irmão, o ninja Genji Shimada foi resgatado pela Overwatch. Para salvar a vida dele, a organização o transformou em uma arma viva com melhorias cibernéticas. Em conflito com sua natureza e propósito após o fim da Overwatch, Genji buscou paz estudando com o monge ômnico Zenyatta antes de atender ao chamado de Winston."),
  Heroi("Tracer", "Tracer é uma aventureira que salta no tempo e uma força do bem irreprimível. Com uma armadura temporal que permite que ela controle seu fluxo no tempo, Tracer era uma das melhores agentes da Overwatch, e continua tentando fazer do mundo um lugar melhor em qualquer lugar e a qualquer hora. Ela usa suas habilidades e otimismo para ajudar a nova Overwatch a manter o mundo seguro."),
  Heroi("Widowmaker", "Há muito tempo, Amélie Lacroix, esposa de um agente da Overwatch, foi sequestrada pela Talon. Pouco depois de voltar para casa, ela matou o marido e desapareceu. Agora, “Widowmaker” é a arma mais eficiente da Talon, uma agente paciente e implacável que quase nunca demonstra emoção ou remorso, e só sente prazer no momento do abate.")];
  List<Heroi> listaSupport = [Heroi("Mercy", "Angela Ziegler, criança prodígio e pioneira em nanotecnologia que ficou órfã durante a Crise Ômnica, se tornou a médica de combate de maior destaque da Overwatch e uma grande defensora da paz mundial. Depois da queda da organização, e com o início de uma nova guerra, ela se questiona se um dia verá a paz."),
  Heroi("Lúcio", "Lúcio cresceu nas favelas do Rio antes se tornar um DJ famoso em seu nicho. Mas, quando a Corporação Vishkar reconstruiu a cidade e destruiu a comunidade, Lúcio recuperou da empresa a tecnologia sônica do pai e a usou para conclamar o povo. Agora, como uma celebridade internacional, ele inspira a mudança social através de suas músicas e ações"),
  Heroi("Zenyatta", "Zenyatta é um monge ômnico que vagueia pelo mundo em busca de iluminação espiritual, ajudando quem ele encontra a superar suas batalhas pessoais e encontrar paz interior. Mas, quando necessário, ele luta para proteger os inocentes, sejam eles ômnicos ou humanos. Dizem que aqueles que cruzam seu caminho não voltam mais os mesmos.")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overwatch", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Overwatch.png"),
            fit: BoxFit.cover)
        ),
        child: Column(children: [
          Padding(padding: EdgeInsets.fromLTRB(20, 500, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  GestureDetector(
                  child: Image.asset("assets/images/tank.png", width: 80, height: 80),
                  onTap: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Tank(listaTank)));
                  },
                ),
                Text("Tank", style: TextStyle(color: Colors.white))
                ]),
                SizedBox(width: 40),
                Column(children: [
                  GestureDetector(
                  child: Image.asset("assets/images/dps.png", width: 80, height: 80),
                  onTap: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DPS(listaDPS)));
                  },
                ),
                Text("DPS", style: TextStyle(color: Colors.white))
                ]),
                SizedBox(width: 40),
                Column(children: [
                  GestureDetector(
                  child: Image.asset("assets/images/support.png", width: 80, height: 80),
                  onTap: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Support(listaSupport)));
                  },
                ),
                Text("Support", style: TextStyle(color: Colors.white))
                ])
              ]))
        
      ])),
    );
  }
}