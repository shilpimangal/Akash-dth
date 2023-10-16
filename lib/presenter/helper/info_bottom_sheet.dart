import 'package:flutter/material.dart';

class InfoBottomSheet {
  void showInfoBottomSheet(BuildContext context, String text, IconData icon, Color color) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
          minHeight: 300, // Set minimum height to 50% of screen height
          maxHeight: MediaQuery.of(context).size.height * 0.5),
      builder: (context) {
        return Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Icon(
              icon,
              size: 50,
              color: color,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(text),
            ),
          ],
        );
      },
    );
  }
}
