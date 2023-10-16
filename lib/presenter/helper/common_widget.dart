import 'package:Akash/presenter/helper/worker_delegate.dart';
import 'package:Akash/presenter/widgets/error_alert_dialog.dart';
import 'package:flutter/material.dart';
import '../../config/theme/app_theme.dart';
import '../../config/theme/custom_colors.dart';
import '../../di/injection_container.dart';

class CommonWidget {
  Future<void> showErrorDialog(
      BuildContext context, String title, String message, int statusCode) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return ErrorAlertDialog(
            title: title,
            message: message,
            statusCode: statusCode,
          );
        });
  }

  ListTile listViewItem(
      BuildContext context, String imageName, String text, String actionType, WorkerDelegate callback) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            imageName,
            // Replace 'assets/your_image.png' with your image asset path
            width: 24.0, // Adjust the width as needed
            height: 24.0, // Adjust the height as needed
          ),
          const SizedBox(width: 8.0),
          // Add some spacing between the image and title
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: sl.get<CustomColors>().hexToColor(sideMenuTextColor),
                ),
          ),
        ],
      ),
      onTap: () {
        callback(context, actionType);
      },
    );
  }

  Widget setSideMenuTermsAndConditions(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(
          top: 40.0,
          bottom: 13.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '2023 © All rights reserved Akash Digital TV.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: sl.get<CustomColors>().hexToColor(sideMenuTextColor),
                  ),
            ),
            Text(
              'Version No.6.1.3',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: sl.get<CustomColors>().hexToColor(sideMenuTextColor),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
