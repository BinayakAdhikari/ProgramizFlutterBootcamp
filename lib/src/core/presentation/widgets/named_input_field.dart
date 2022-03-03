import 'package:flutter/material.dart';
import 'package:todo_app/src/config/appConfig.dart';

class NamedInputField extends StatefulWidget {
  final TextEditingController controller;
  final String title;

  const NamedInputField(
      {Key? key, required this.controller, required this.title})
      : super(key: key);

  @override
  State<NamedInputField> createState() => NamedInputFieldState();
}

class NamedInputFieldState extends State<NamedInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppConfig().themeData.textTheme.headline4,
        ),
        TextFormField(
          controller: widget.controller,
        ),
      ],
    );
    ;
  }
}
