import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: camel_case_types
class Resultado extends StatelessWidget {
  final String altura;
  final String peso;
  final String idade;
  final String sexo;
  const Resultado({required this.altura, required this.peso, required this.idade, required this.sexo});
  
  @override
  Widget build(BuildContext context) {
    // Recupera os parâmetros da rota
    double altura = double.parse(this.altura);
    double peso = double.parse(this.peso);
    int idade = int.parse(this.idade);
    String sexo = this.sexo;

    double varSexo = 0;
    if (sexo == "Masculino") {
      varSexo = 1.0;
    }
    else if (sexo == "Feminino"){
      varSexo = 0.8;
    }
    double igc = 0;
    // Faça o cálculo do IMC
    double imc = 0;
    if (altura != null && peso != null) {
      imc = peso / (altura * altura);
      igc = (1.2 * imc) + (0.23 * idade) - (10.8 * varSexo) - 5.4;
    } 

    String IGCformat = igc.toStringAsFixed(2);
    String IMCformat = imc.toStringAsFixed(2);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('IMC: $IMCformat'),
            Text('IGC: $IGCformat'),
          ],
        ),
      ),
    );
  }
}