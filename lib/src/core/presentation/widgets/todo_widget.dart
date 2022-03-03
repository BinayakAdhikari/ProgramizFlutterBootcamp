import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/src/todo_feature/domain/entity/todo_entity.dart';

import '../../../config/appConfig.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  final Function(TodoEntity)? callback;
  final Function(DoneEntity)? deleteCallback;
  const TodoWidget(
      {Key? key, required this.todo, this.callback, this.deleteCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late bool isTodo;
    late String dateString;
    if (todo is TodoEntity) {
      isTodo = true;
      DateTime todoDate = (todo as TodoEntity).startDate;
      dateString = "${todoDate.month}/${todoDate.day}";
    } else {
      isTodo = false;
      DateTime doneDate = (todo as DoneEntity).doneDate;

      dateString = "${doneDate.month}/${doneDate.day}";
    }
    return GestureDetector(
      onHorizontalDragEnd: ((details) {
        // if (details.primaryVelocity != null && !isTodo) {
        //   if (details.primaryVelocity! > 1000.0) {
        //     deleteCallback!(todo as DoneEntity);
        //   }
        // }
      }),
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: isTodo ? white : secondary,
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                if (isTodo) {
                  try {
                    callback!((todo as TodoEntity));
                  } on TypeError catch (e) {
                    print(e);
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  isTodo
                      ? "assets/icons/circle.svg"
                      : "assets/icons/check-circle.svg",
                  color: isTodo ? grey : secondaryDarker,
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                todo.todoTask,
                style: AppConfig().themeData.textTheme.bodyText1,
              ),
            )),
            Text(
              dateString,
              style: AppConfig().themeData.textTheme.headline4,
            )
          ],
        ),
      ),
    );
  }
}
