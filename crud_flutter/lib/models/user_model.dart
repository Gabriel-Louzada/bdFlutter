import 'package:flutter/material.dart';

class User extends StatefulWidget {
  final int id;
  final String nome;
  final int idade;

  const User(this.id, this.nome, this.idade, {super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
