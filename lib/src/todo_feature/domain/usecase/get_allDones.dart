import 'package:todo_app/src/todo_feature/domain/entity/todo_entity.dart';
import 'package:todo_app/src/todo_feature/domain/repository/todo_repository.dart';

class GetAllDones {
  final TodoRepository repository;

  GetAllDones({required this.repository});

  Future<List<DoneEntity>> execute() async {
    return repository.getAllDones();
  }
}
