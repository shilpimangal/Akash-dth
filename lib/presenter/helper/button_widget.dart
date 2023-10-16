import 'package:Akash/presenter/helper/worker_delegate.dart';
import 'package:flutter/material.dart';


class ButtonWidget {

  Widget rectangularButton(
      BuildContext context, String buttonText, Color bgColor,
      Color textColor, String actionType,
      WorkerDelegate callback) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          callback (context, actionType);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          // Background color
          foregroundColor: textColor,
          // Text color
          shape: RoundedRectangleBorder(
            // Rectangular shape
            borderRadius: BorderRadius.circular(25), // Rounded corners
          ),
          padding: const EdgeInsets.all(15), // Padding around the text
        ),
        child: Text(buttonText),
      ),
    );
  }

  Widget textButton(
      BuildContext context, String buttonText, Color textColor,
      String actionType, WorkerDelegate callback) {
    return TextButton(
      onPressed: () {
        callback(context, actionType);
      },
      child: Text(
        buttonText,
        style: TextStyle(color: textColor),
      ),
    );
  }

  IconButton showIconButton(
      BuildContext context, IconData iconData,
      String actionType, WorkerDelegate callback) {
    return IconButton(
      icon: Icon(
        iconData,
        color: const Color.fromRGBO(29, 157, 218, 1),
      ),
      onPressed: () {
        callback (context, actionType);
      },
    );
  }
}
