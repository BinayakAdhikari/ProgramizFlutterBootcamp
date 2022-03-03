import 'package:todo_app/src/todo_feature/data/model/todo_model.dart';

abstract class Todo {
  final String? id;
  final String todoTask;

  Todo({required this.todoTask, this.id});
}

class TodoEntity extends Todo {
  final DateTime startDate;

  TodoEntity({required this.startDate, required String todoTask, String? id})
      : super(todoTask: todoTask, id: id);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "task_name": todoTask,
      "start_time": startDate,
    };
  }

  DoneEntity getItDone() {
    return DoneEntity(
      doneDate: DateTime.now(),
      todoTask: todoTask,
      id: id!,
    );
  }
}

class DoneEntity extends Todo {
  final DateTime doneDate;

  DoneEntity({required this.doneDate, required String todoTask, String? id})
      : super(todoTask: todoTask, id: id);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "task_name": todoTask,
      "end_time": doneDate,
    };
  }
}
