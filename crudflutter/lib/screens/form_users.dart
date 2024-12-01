import 'package:crudflutter/components/users_components.dart';
import 'package:crudflutter/data/Users_dao.dart';
import 'package:flutter/material.dart';

class FormUsers extends StatefulWidget {
  const FormUsers({super.key, required this.userContext});

  final BuildContext userContext;

  @override
  State<FormUsers> createState() => _FormUsersState();
}

class _FormUsersState extends State<FormUsers> {
  // nunca esquecer que os Controllers ficam dentro desta class
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();

  //abrindo o banco de dados para inserir valores
  final db = abrirBancoDeDados();

  final _formKey = GlobalKey<FormState>();

  //metodo para validar se o campo foi preenchido corretamente
  bool validar(String? valor) {
    if (valor == null || valor.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Cadastrando usuario"),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SizedBox(
            width: 500,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Tela de cadastro",
                    style: TextStyle(fontSize: 45),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: _nomeController,
                    validator: (String? value) {
                      if (validar(value)) {
                        return "O campo nome deve ser preenchido";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Digite seu nome"),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _idadeController,
                    validator: (String? valor) {
                      if (validar(valor)) {
                        return "O campo idade deve ser preenchido";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Digite sua idade"),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final nome = _nomeController.text.trim(); //remove os espaços vazios na string
                          final idade = _idadeController.text.trim();

                          final UserComponents usuario = UserComponents(0, nome: nome, idade: int.parse(idade));
                          insertUser(db, usuario);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text("Adicionando usuario.")));
                        }
                      },
                      child: const Text(
                        "Adicionar",
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
