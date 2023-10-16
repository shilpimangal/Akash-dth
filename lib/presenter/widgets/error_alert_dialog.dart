import 'package:flutter/material.dart';

class ErrorAlertDialog extends StatelessWidget {
  final title;
  final message;
  final statusCode;

  const ErrorAlertDialog({super.key, required this.title, required this.message, required this.statusCode});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text("$message: [$statusCode]"),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}