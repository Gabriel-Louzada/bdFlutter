import 'package:crudflutter/components/users_components.dart';
import 'package:crudflutter/data/Users_dao.dart';
import 'package:sqlite3/sqlite3.dart';

class UserRepo {
  Database db = abrirBancoDeDados();
  List<UserComponents> listaUsuario = [];

  checarValor(String? valor) {
    if (valor == null || valor.isEmpty) {
      print("\nCampo não preenchido digite novamente!");
      return "\nCampo não preenchido digite novamente!";
    } else {
      return valor;
    }
  }

  verTodosUsuarios(db) {
    ResultSet mapUsuarios = getUsers(db);
    for (var i in mapUsuarios) {
      UserComponents usuario = UserComponents(i["id"], nome: i["name"], idade: i["age"]);
      listaUsuario.add(usuario);
    }
    return listaUsuario;
  }
}
