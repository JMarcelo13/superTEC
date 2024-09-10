import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;

    // Si la base de datos no ha sido creada, crearla aquí.
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    try {
      String path = join(await getDatabasesPath(), 'user_database.db');
      return await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
      );
    } catch (e) {
      debugPrint('Error al inicializar la base de datos: $e');
      throw Exception('Error al inicializar la base de datos');
    }
  }

  // Crear la tabla 'users' al iniciar la base de datos.
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        username TEXT,
        password TEXT
      )
    ''');

    // Insertar el usuario por defecto
    await db.insert('users', {'username': 'admin', 'password': 'pass'});
  }

  // Método para autenticar un usuario.
  Future<bool> authenticateUser(String username, String password) async {
    Database? db = await instance.database;
    var result = await db?.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    return result?.isNotEmpty ?? false;
  }
}
