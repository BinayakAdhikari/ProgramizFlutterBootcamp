import 'package:todo_app/src/todo_feature/domain/entity/todo_entity.dart';
import 'package:todo_app/src/todo_feature/domain/repository/todo_repository.dart';

class AddToDo {
  final TodoRepository repository;
  final TodoEntity todoEntity;

  AddToDo({required this.repository, required this.todoEntity});

  Future<TodoEntity?> execute() async {
    return await repository.addTodo(todo: todoEntity);
  }
}
