import 'package:todo_app/src/todo_feature/data/datasource/todo_datasource.dart';
import 'package:todo_app/src/todo_feature/domain/entity/todo_entity.dart';
import 'package:todo_app/src/todo_feature/domain/repository/todo_repository.dart';

class TodoRepositroyImp extends TodoRepository {
  final TodoDatasourceImp todoDatasourceImp;

  TodoRepositroyImp({required this.todoDatasourceImp});
  @override
  Future<TodoEntity?> addTodo({required TodoEntity todo}) async {
    return await todoDatasourceImp.addTodo(todoEntity: todo);
  }

  @override
  completeTodo({required TodoEntity todo, required DoneEntity doneEntity}) {
    todoDatasourceImp.completeTodo(todoEntity: todo, doneEntity: doneEntity);
  }

  @override
  Future<List<DoneEntity>> getAllDones() async {
    return todoDatasourceImp.getDones();
  }

  @override
  Future<List<TodoEntity>> getAllTodos() async {
    return todoDatasourceImp.getTodos();
  }

  @override
  deleteTodo({required DoneEntity doneEntity}) {
    todoDatasourceImp.deleteTodo(doneEntity: doneEntity);
  }
}
