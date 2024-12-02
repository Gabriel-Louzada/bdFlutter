import 'package:crudflutter/data/Users_dao.dart';
import 'package:crudflutter/repo/user_repo.dart';
import 'package:crudflutter/screens/form_users_update.dart';
import 'package:flutter/material.dart';

class UserComponents extends StatefulWidget {
  final int id;
  final String nome;
  final int idade;

  //construtor
  const UserComponents(this.id, {super.key, required this.nome, required this.idade});

  @override
  State<UserComponents> createState() => _UserComponentsState();
}

class _UserComponentsState extends State<UserComponents> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: 60,
            color: Colors.white60,
            child: Text(
              "${widget.id}",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            width: 300,
            color: Colors.white60,
            child: Text(
              widget.nome,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            width: 60,
            color: Colors.white60,
            child: Text(
              "${widget.idade}",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contextNew) => FormUsersUpdate(userContext: context),
                  ),
                );
              },
              child: const Icon(Icons.edit)),
          ElevatedButton(
              onPressed: () {
                deleteUser(UserRepo().db, widget.id);
              },
              child: const Icon(Icons.remove_circle_outline)),
        ]),
      ],
    );
  }
}
