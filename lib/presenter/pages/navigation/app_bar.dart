import 'package:Akash/presenter/helper/button_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/helper/constants.dart';
import '../../../di/injection_container.dart';
import '../../helper/worker_delegate.dart';

class AkashAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AkashAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final ButtonWidget commonWidget = sl.get<ButtonWidget>();
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color.fromRGBO(29, 157, 218, 1),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      title: Row(
        children: [
          Image.asset(
            'assets/image/logo.png',
            width: 80.0,
            height: 80.0,
          ),
        ],
      ),
      actions: [
        commonWidget.showIconButton(context,
           Icons.search,
            actionTypSearch, onClickEvent),
        commonWidget.showIconButton(context,
            Icons.notifications,
            actionTypeNotification,onClickEvent),
      ],
    );
  }

  void onClickEvent(BuildContext context, String actionType) {
    switch (actionType) {
      case actionTypSearch:
        //do some task
      print("Click on Search");
        break;
      case actionTypeNotification:
        //do some task
        print("Click on Notification");
        break;
    }
  }
}
