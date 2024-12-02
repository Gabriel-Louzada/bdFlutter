import 'package:crudflutter/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}


//LEMBRESSE DE COLOCAR O SQLITE3.DLL DENTRO DA PASTA NESSE CAMINHO PARA DEPURAR O SISTEMA 
//C:\Users\billo\OneDrive\Documentos\Alura\flutter\bdFlutter\crudflutter\build\windows\x64\runner\Debug