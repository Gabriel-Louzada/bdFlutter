import 'package:crudflutter/components/users_components.dart';
import 'package:crudflutter/repo/user_repo.dart';
import 'package:crudflutter/screens/form_users.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Pego os usuarios do banco de dados e utilizo nessa tela
  List<UserComponents> usuarios = UserRepo().verTodosUsuarios(UserRepo().db);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
              //Botão de atualizar a tela
              onPressed: () {
                //faço uma nova consulta no banco de dados
                List<UserComponents> newUsuarios = UserRepo().verTodosUsuarios(UserRepo().db);
                setState(() {
                  //Quando o botão for clicado ele pega os novos usuarios e joga a lista usuarios
                  // fazendo com que mude a tela
                  usuarios = newUsuarios;
                });
              },
              icon: const Icon(Icons.refresh)),
        ],
        backgroundColor: Colors.amber,
        title: const Text("Teste Crud com flutter"),
      ),
      body: Center(
        child: Container(
          width: 500,
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      color: Colors.white60,
                      child: const Text(
                        "ID#",
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      width: 300,
                      color: Colors.white60,
                      child: const Text(
                        "Nome",
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      width: 60,
                      color: Colors.white60,
                      child: const Text(
                        "Idade",
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                //Percorro a lista e crio na tela os componentes
                for (int i = 0; i < usuarios.length; i++)
                  UserComponents(
                    usuarios[i].id,
                    nome: usuarios[i].nome,
                    idade: usuarios[i].idade,
                  )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormUsers(
                userContext: context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
