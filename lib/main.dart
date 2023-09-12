// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'models/pessoa.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Calculadora IMC',
    home: CalculadoraIMC(),
  ));
}

class CalculadoraIMC extends StatefulWidget {
  const CalculadoraIMC({super.key});

  @override
  _CalculadoraIMCState createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String resultado = "";
  late Pessoa pessoa;

  void calcularIMC() {
    String nome = nomeController.text;
    double peso = double.tryParse(pesoController.text) ?? 0;
    double altura = double.tryParse(alturaController.text) ?? 0;

    if (peso > 0 && altura > 0) {
      pessoa = Pessoa(nome, peso, altura);

      double imc = pessoa.peso / (pessoa.altura * pessoa.altura);

      setState(() {
        resultado = "${pessoa.nome}, seu IMC é: ${imc.toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        resultado = "Preencha peso e altura válidos.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nomeController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Nome Pessoa'),
            ),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (m)    Ex: 1.80',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularIMC,
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 20),
            Text(
              resultado,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
