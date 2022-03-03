import 'package:todo_app/src/config/appEnums.dart';
import 'package:todo_app/src/services/sqlite_service.dart';
import 'package:todo_app/src/todo_feature/data/model/todo_model.dart';
import 'package:todo_app/src/todo_feature/domain/entity/todo_entity.dart';

abstract class TodoDatasource {
  Future<List<TodoEntity>> getTodos();
  Future<List<DoneEntity>> getDones();
  Future<TodoEntity?> addTodo({required TodoEntity todoEntity});
  void completeTodo(
      {required TodoEntity todoEntity, required DoneEntity doneEntity});
  void deleteTodo({required DoneEntity doneEntity});
}

class TodoDatasourceImp extends TodoDatasource {
  final SqliteService sqliteService;

  TodoDatasourceImp({required this.sqliteService});
  @override
  Future<List<DoneEntity>> getDones() async {
    List<DoneEntity> outputList = [];
    List<Map<dynamic, dynamic>> rawData =
        await sqliteService.getTodos(type: DatabaseTableTypes.done);
    for (Map<dynamic, dynamic> indexRawData in rawData) {
      DoneEntity doneEntity = DoneEntity(
          doneDate: DoneModel.fromMap(indexRawData).doneDate,
          todoTask: DoneModel.fromMap(indexRawData).todoTask,
          id: DoneModel.fromMap(indexRawData).id);
      ;

      outputList.add(doneEntity);
    }

    return outputList;
  }

  @override
  Future<List<TodoEntity>> getTodos() async {
    List<TodoEntity> outputList = [];
    List<Map<dynamic, dynamic>> rawData =
        await sqliteService.getTodos(type: DatabaseTableTypes.todo);
    for (Map<dynamic, dynamic> indexRawData in rawData) {
      TodoEntity todoEntity = TodoEntity(
          startDate: TodoModel.fromMap(indexRawData).startDate,
          todoTask: TodoModel.fromMap(indexRawData).todoTask,
          id: TodoModel.fromMap(indexRawData).id);

      outputList.add(todoEntity);
    }

    return outputList;
  }

  @override
  Future<TodoEntity?> addTodo({required TodoEntity todoEntity}) async {
    Map<dynamic, dynamic>? rawData = await sqliteService.insertTodo(
      todoModel: TodoModel.fromMap(
        todoEntity.toMap(),
      ),
    );
    if (rawData != null) {
      return TodoEntity(
          id: TodoModel.fromMap(rawData).id,
          startDate: TodoModel.fromMap(rawData).startDate,
          todoTask: TodoModel.fromMap(rawData).todoTask);
    } else {
      return null;
    }
  }

  @override
  void completeTodo(
      {required TodoEntity todoEntity, required DoneEntity doneEntity}) {
    sqliteService.completeTodo(
      doneModel: DoneModel.fromMap(
        doneEntity.toMap(),
      ),
      todoModel: TodoModel.fromMap(
        todoEntity.toMap(),
      ),
    );
  }

  @override
  void deleteTodo({required DoneEntity doneEntity}) {
    sqliteService.deleteTodo(doneModel: DoneModel.fromMap(doneEntity.toMap()));
  }
}
