import 'package:todo_app/src/todo_feature/domain/entity/todo_entity.dart';
import 'package:todo_app/src/todo_feature/domain/repository/todo_repository.dart';

class CompleteTodo {
  final TodoRepository repository;
  final TodoEntity todoEntity;
  final DoneEntity doneEntity;

  CompleteTodo(
      {required this.doneEntity,
      required this.repository,
      required this.todoEntity});

  void exectue() {
    repository.completeTodo(todo: todoEntity, doneEntity: doneEntity);
  }
}
