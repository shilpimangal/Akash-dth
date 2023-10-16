import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          "Menu page",
          style: Theme.of(context).textTheme.titleLarge
      ),
    );
  }
}
