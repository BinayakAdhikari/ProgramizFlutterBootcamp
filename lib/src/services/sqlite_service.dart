import 'package:sqflite/sqflite.dart';
import 'package:todo_app/src/config/appEnums.dart';
import 'package:todo_app/src/todo_feature/data/model/todo_model.dart';
import 'package:todo_app/src/todo_feature/domain/entity/todo_entity.dart';

class SqliteService {
  late final Database db;
  static const String TODO_TABLE = 'Todos';
  static const String DONE_TABLE = 'Dones';
  // Initialize database call at start of application
  Future<void> initializeDb() async {
    db = await openDatabase('todos.db', version: 1,
        onCreate: (Database db, int ver) async {
      await db.execute(
          'CREATE TABLE $TODO_TABLE (id INTEGER PRIMARY KEY AUTOINCREMENT, task_name TEXT, start_time STRING)');
      await db.execute(
          'CREATE TABLE $DONE_TABLE (id INTEGER PRIMARY KEY, task_name TEXT, end_time STRING)');
    });
  }

  //Get todos
  Future<List<Map>> getTodos({required DatabaseTableTypes type}) async {
    if (type == DatabaseTableTypes.todo) {
      return await db.rawQuery('SELECT * FROM $TODO_TABLE');
    } else {
      return await db.rawQuery('SELECT * FROM $DONE_TABLE');
    }
  }

  //insert todo
  Future<Map?> insertTodo({required TodoModel todoModel}) async {
    int id = await db.rawInsert(
        'INSERT INTO $TODO_TABLE(task_name, start_time) VALUES("${todoModel.todoTask}","${todoModel.startDate.toIso8601String()}")');
    if (id != 0) {
      return await getSingleTodo(id: id);
    } else {
      return null;
    }
  }

  // Complete todo
  void completeTodo(
      {required TodoModel todoModel, required DoneModel doneModel}) {
    db.rawDelete('DELETE FROM $TODO_TABLE WHERE id=${todoModel.id}');
    db.rawInsert(
        'INSERT INTO $DONE_TABLE(id, task_name, end_time) VALUES(${doneModel.id},"${doneModel.todoTask}","${doneModel.doneDate.toIso8601String()}")');
  }

  Future<Map?> getSingleTodo({required int id}) async {
    List<Map> result =
        await db.rawQuery('SELECT * FROM $TODO_TABLE WHERE id=$id');
    if (result.length > 0) {
      return result[0];
    } else {
      return null;
    }
  }

  void deleteTodo({required DoneModel doneModel}) {
    db.rawDelete('DELETE FROM $DONE_TABLE WHERE id=${doneModel.id}');
  }
}
