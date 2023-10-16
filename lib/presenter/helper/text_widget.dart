import 'package:flutter/material.dart';
import 'package:Akash/presenter/helper/worker_delegate.dart';

class TextWidget {

  Widget rowWithTwoText(
      BuildContext context,
      MainAxisAlignment rowPosition,
      String firstText,
      String secondText,
      Color firstTextColor,
      Color secondTextColor,
      String? actionType,
      WorkerDelegate callback) {
    return InkWell(
      onTap: () {
        if (actionType != null) {
          callback(context, actionType);
        }
      },
      child: Row(
        mainAxisAlignment: rowPosition,
        children: [
          Text(
            firstText,
            style: TextStyle(color: firstTextColor),
          ),
          Text(
            secondText,
            style: TextStyle(color: secondTextColor),
          ),
        ],
      ),
    );
  }
}
