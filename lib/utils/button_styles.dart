import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle primaryElevatedButtonStyle({
    required double screenHeight,
    required double screenWidth,
    required BuildContext context,
  }) {
    return ElevatedButton.styleFrom(
      minimumSize: Size(
        screenWidth * 0.5,
        screenHeight * 0.08,
      ),
      maximumSize: Size(
        screenWidth * 0.5,
        screenHeight * 0.08,
      ),
      elevation: 3.0,
      shadowColor: Colors.black,
      backgroundColor: Colors.blue,
      padding: EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 24.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
        side: BorderSide.none,
      ),
    );
  }
}