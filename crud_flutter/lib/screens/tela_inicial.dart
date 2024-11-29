import 'package:flutter/material.dart';

class telaInicial extends StatefulWidget {
  const telaInicial({super.key});

  @override
  State<telaInicial> createState() => _telaInicialState();
}

class _telaInicialState extends State<telaInicial> {
  //final TextEditingController _nomeController = TextEditingController();
  //final TextEditingController _idadeController = TextEditingController();

  bool validar(String? valor) {
    if (valor != null && valor.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu primeiro Crud"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(),
    );
  }
}
