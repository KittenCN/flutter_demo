import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database _database;

  Future<Database> get database async {
    _database = await _initDB();
    return _database;
  }

  _initDB() async {
    String path = await getDatabasesPath();
    path = join(path, 'todo.db');
    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE todo(id INTEGER PRIMARY KEY, description TEXT, ischeck INTEGER)');
  }

  Future close() async {
    var result = _database.close();
    return result;
  }

  Future<int> insert(Todo todo) async {
    var db = await database;
    var result = await db.insert('todo', todo.toMap());
    return result;
  }

  Future<List> getTodos() async {
    var db = await database;
    var result = await db.query('todo');
    List todos = result.isNotEmpty
        ? result.map((todo) => Todo.fromMap(todo)).toList()
        : [];
    return todos;
  }

  Future<int> update(Todo todo) async {
    var db = await database;
    var result = await db
        .update('todo', todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
    return result;
  }

  Future<int> delete(int id) async {
    var db = await database;
    var result = await db.delete('todo', where: 'id = ?', whereArgs: [id]);
    return result;
  }

  Future<int> deleteAll() async {
    var db = await database;
    var result = await db.delete('todo');
    return result;
  }

  Future<int?> getCount() async {
    var db = await database;
    int? result =
        Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM todo'));
    return result ?? 0;
  }

  Future<Todo> getTodo(int id) async {
    var db = await database;
    var result = await db.query('todo', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? Todo.fromMap(result.first) : null;
  }

  Future<List> getTodosByCheck(int isCheck) async {
    var db = await database;
    var result =
        await db.query('todo', where: 'isCheck = ?', whereArgs: [isCheck]);
    List todos = result.isNotEmpty
        ? result.map((todo) => Todo.fromMap(todo)).toList()
        : [];
    return todos;
  }

  Future<List> getTodosByDescription(String description) async {
    var db = await database;
    var result = await db
        .query('todo', where: 'description = ?', whereArgs: [description]);
    List todos = result.isNotEmpty
        ? result.map((todo) => Todo.fromMap(todo)).toList()
        : [];
    return todos;
  }

  Future<List> getTodosByCheckAndDescription(
      int isCheck, String description) async {
    var db = await database;
    var result = await db.query('todo',
        where: 'isCheck = ? AND description = ?',
        whereArgs: [isCheck, description]);
    List todos = result.isNotEmpty
        ? result.map((todo) => Todo.fromMap(todo)).toList()
        : [];
    return todos;
  }
  Future<List> getMemList() async {
    var db = await database;
    var result = await db.query('todo');
    List mems = result.isNotEmpty
        ? result.map((todo) => Todo.fromMap(todo)).toList()
        : [];
    return mems;
  } 
}

class Todo {
  late int id;
  late String description;
  late int ischeck;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'ischeck': ischeck,
    };
  }

  static fromMap(Map<String, dynamic> todo) {
    Todo t = Todo();
    t.id = todo['id'];
    t.description = todo['description'];
    t.ischeck = todo['ischeck'];
    return t;
  }
}
