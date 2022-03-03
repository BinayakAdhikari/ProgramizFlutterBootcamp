import 'package:todo_app/src/todo_feature/domain/entity/todo_entity.dart';
import 'package:todo_app/src/todo_feature/domain/repository/todo_repository.dart';

class GetTodos {
  final TodoRepository repository;

  GetTodos({required this.repository});

  Future<List<TodoEntity>> execute() async {
    return await repository.getAllTodos();
  }
}
