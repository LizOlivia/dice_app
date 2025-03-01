import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DadosPage extends StatefulWidget {
  const DadosPage({super.key});

  @override
  State<DadosPage> createState() => _DadosPageState();
}

class _DadosPageState extends State<DadosPage> {
  int dadoSelecionado = 1;
  Timer? timer;
  int segundos = 6;
  bool estaGirando = false;

  void jogar() {
    if (estaGirando == false) {

          var rnd = Random();

          setState(() {
            estaGirando = true;

          });

    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      print(t.tick);
      setState(() {
        dadoSelecionado = rnd.nextInt(6) + 1;
      });

      if (t.tick == segundos) {
        timer!.cancel();
        timer = null;

        setState(() {
          estaGirando = false;
        });
      }
    });
  }}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/bg.jpg"),
        ),
      ),

      child: Center(
        child: GestureDetector(
          onTap: jogar,
          child: Image.asset("assets/$dadoSelecionado.png"),
        ),
      ),
    );
  }
}
