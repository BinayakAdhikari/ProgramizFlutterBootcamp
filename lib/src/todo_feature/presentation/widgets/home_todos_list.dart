import 'package:flutter/material.dart';
import 'package:todo_app/src/core/presentation/widgets/todo_widget.dart';
import 'package:todo_app/src/todo_feature/domain/entity/todo_entity.dart';

class HomeTodos extends StatelessWidget {
  final List<Todo> data;
  final Function(TodoEntity)? changeDataCallback;
  final Function(DoneEntity)? deleteCallback;
  const HomeTodos(
      {Key? key,
      required this.data,
      this.changeDataCallback,
      this.deleteCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTodoWidget;

    if (data is List<TodoEntity>) {
      isTodoWidget = true;
    } else {
      isTodoWidget = false;
    }

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.only(
              bottom: 18.0,
            ),
            child: isTodoWidget
                ? TodoWidget(
                    todo: data[index],
                    callback: (TodoEntity todo) {
                      changeDataCallback!(todo);
                    },
                  )
                : TodoWidget(
                    todo: data[index],
                    deleteCallback: (DoneEntity doneEntity) {
                      deleteCallback!(doneEntity);
                    },
                  ));
      },
    );
  }
}
