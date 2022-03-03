import 'package:todo_app/src/todo_feature/domain/entity/todo_entity.dart';
import 'package:todo_app/src/todo_feature/domain/repository/todo_repository.dart';

class DeleteDone {
  final DoneEntity doneEntity;
  final TodoRepository todoRepository;

  DeleteDone({required this.todoRepository, required this.doneEntity});

  execute() {
    todoRepository.deleteTodo(doneEntity: doneEntity);
  }
}
