import 'package:crudflutter/components/users_components.dart';
import 'package:sqlite3/sqlite3.dart'; // Importando o sqlite3

Database abrirBancoDeDados() {
  const databasePath = "Users.db";
  final db = sqlite3.open(databasePath);
  db.execute('''
    CREATE TABLE IF NOT EXISTS users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      age INTEGER NOT NULL
    );
  ''');
  return db;
}

//Função para inserir um usuario
void insertUser(Database db, UserComponents usuario) {
  db.execute('''
    INSERT INTO users (name, age) 
    VALUES (?, ?);
  ''', [usuario.nome, usuario.idade]);
}

//Função para obter todos os usuarios.
ResultSet getUsers(Database db) {
  final resultados = db.select('SELECT * FROM users');
  return resultados;
}

// Função para atualizar um usuário
void updateUser(Database db, UserComponents usuario) {
  db.execute('''
 UPDATE users 
    SET name = ?, age = ?
    WHERE id = ?;
  ''', [usuario.nome, usuario.idade, usuario.id]);
}

void deleteUser(Database db, int id) {
  db.execute('''
    DELETE FROM users WHERE id = ?;
  ''', [id]);
}
