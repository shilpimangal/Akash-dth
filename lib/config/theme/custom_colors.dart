import 'package:Akash/config/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomColors {
  // Define your custom colors as static constants

    Color hexToColor(String hexColor) {
      String formattedHex =  "FF${hexColor.toUpperCase().replaceAll("#", "")}";
      return Color(int.parse(formattedHex, radix: 16));
    }

  final navDrawableBG = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 0, 173, 238),
      Color.fromARGB(255, 147, 41, 116),
      Color.fromARGB(255, 229, 38, 43),
    ],
  );

    final spBottomGradient =  const SweepGradient(
      transform: GradientRotation(180),
      colors: [Color(0xffe5262b), Color(0xff00adee), Color(0xff932974)],
      stops: [0, 0, 1],
      center: Alignment.bottomCenter,
    );

    final spTopGradient = LinearGradient(
      begin: FractionalOffset.topRight,
      end: FractionalOffset.bottomLeft,
      transform: const GradientRotation(180),
      colors: [
        const Color.fromARGB(255, 229, 38, 43).withOpacity(0.8),
        const Color.fromARGB(255, 147, 41, 116).withOpacity(0.88),
        const Color.fromARGB(255, 0, 173, 238).withOpacity(0.88),
      ],
      stops: const [0.0, 1.0, 1.0],
    );

    final bottomTabBG = const LinearGradient(
      colors: [
        Color.fromARGB(255, 229, 38, 43), // First color
        Color.fromARGB(255, 147, 41, 116), // Second color
        Color.fromARGB(255, 0, 173, 238), // Third color
      ],
      stops: [0.0, 0.5, 1.0], // Adjust the stops as needed
    );

    final tabIconColor = const LinearGradient(
      colors: [
        Color.fromARGB(255, 229, 38, 43), // First color
        Color.fromARGB(255, 147, 41, 116), // Second color
        Color.fromARGB(255, 0, 173, 238), // Third color
      ],
      stops: [0.0, 0.5, 1.0], // Adjust the stops as needed
    );
}
