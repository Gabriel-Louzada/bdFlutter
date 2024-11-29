import 'package:crudflutter/components/users_components.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Teste Crud com flutter"),
      ),
      body: Center(
        child: Container(
          width: 500,
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
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
              const UserComponents(5, nome: "Gabriel Teste", idade: 7),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
