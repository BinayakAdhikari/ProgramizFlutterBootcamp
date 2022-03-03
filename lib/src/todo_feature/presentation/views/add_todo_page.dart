import 'package:flutter/material.dart';

import 'package:todo_app/src/config/appConfig.dart';
import 'package:todo_app/src/core/presentation/widgets/named_input_field.dart';
import 'package:todo_app/src/core/presentation/widgets/rounded_button.dart';
import 'package:todo_app/src/todo_feature/domain/entity/todo_entity.dart';
import 'package:todo_app/src/todo_feature/presentation/widgets/add_todo_header.dart';

//! Used stateful incase of validation requirements
class AddTodoPage extends StatefulWidget {
  final Function(TodoEntity) callback;
  const AddTodoPage({Key? key, required this.callback}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController _tasknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _addToDoView(),
        ),
      ),
    );
  }

  Widget _addToDoView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const AddTodoHeader(),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: NamedInputField(
                controller: _tasknameController,
                title: "Task Name",
              ),
            ),
          ],
        ),
        RoundedButton(
          title: "Add",
          callback: () {
            if (_tasknameController.text.isNotEmpty) {
              // Send Todo back to homepage
              widget.callback(
                TodoEntity(
                  startDate: DateTime.now(),
                  todoTask: _tasknameController.text,
                ),
              );

              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Please enter in the fields!",
                    style: TextStyle(
                      fontSize:
                          AppConfig().themeData.textTheme.headline4!.fontSize,
                      fontWeight:
                          AppConfig().themeData.textTheme.headline4!.fontWeight,
                      color: white,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
