import 'package:todo_app/src/todo_feature/domain/entity/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getAllTodos();
  Future<List<DoneEntity>> getAllDones();
  Future<TodoEntity?> addTodo({required TodoEntity todo});
  completeTodo({
    required TodoEntity todo,
    required DoneEntity doneEntity,
  });

  deleteTodo({required DoneEntity doneEntity});
}
