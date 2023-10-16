import 'package:Akash/config/theme/custom_colors.dart';
import 'package:flutter/material.dart';

import '../../../di/injection_container.dart';
import 'nav_bar_items.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildNavItem(0, Icons.settings, NavbarItem.Settings.name),
        buildNavItem(1, Icons.chat, NavbarItem.Chat.name),
        buildNavItem(2, Icons.home, NavbarItem.Home.name),
        buildNavItem(3, Icons.library_books, NavbarItem.Tutorial.name),
        buildNavItem(4, Icons.menu, NavbarItem.Menu.name),
      ],
    );
  }

  Widget buildNavItem(int index, IconData icon, String label) {
    final isActive = currentIndex == index;
    final iconGradient = sl.get<CustomColors>().tabIconColor;
    final iconOpacity = isActive ? 1.0 : 0.48;
    final labelOpacity = isActive ? 1.0 : 0.48;

    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 4.0, // Add some vertical spacing
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return iconGradient.createShader(bounds);
            },
            child: Icon(
              icon,
              size: 24.0,
              color: Colors.white.withOpacity(iconOpacity),
            ),
          ),
          const SizedBox(
            height: 4.0, // Add some vertical spacing
          ),
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFF8B4A8B).withOpacity(labelOpacity), // Set text color
            ),
          ),
        ],
      ),
    );
  }
}
