import 'package:todo_app/src/todo_feature/domain/entity/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel(
      {required DateTime startDate,
      required String todoTask,
      required String id})
      : super(startDate: startDate, todoTask: todoTask, id: id);

  factory TodoModel.fromMap(Map<dynamic, dynamic> data) {
    return TodoModel(
        startDate: data['start_time'] is String
            ? DateTime.parse(data['start_time'])
            : data['start_time'],
        todoTask: data['task_name'],
        id: data['id'].toString());
  }
}

class DoneModel extends DoneEntity {
  DoneModel(
      {required DateTime doneDate,
      required String todoTask,
      required String id})
      : super(doneDate: doneDate, todoTask: todoTask, id: id);

  factory DoneModel.fromMap(Map<dynamic, dynamic> data) {
    return DoneModel(
        doneDate: data['end_time'] is String
            ? DateTime.parse(data['end_time'])
            : data['end_time'],
        todoTask: data['task_name'],
        id: data['id'].toString());
  }
}
