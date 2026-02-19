import 'package:course_app_flutter/styles/app_styles.dart';
import 'package:flutter/material.dart';

typedef OnNavigationTap = void Function();

class ButtonHomeScreen extends StatelessWidget {
  final String label;
  final OnNavigationTap onPressed;

  const ButtonHomeScreen({
    super.key,
    required this.label,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: AppStyles.machineButtonStyle.copyWith(
        fixedSize: WidgetStateProperty.all(const Size(400, 200)),
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            softWrap: false,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Button2HomeScreen extends StatelessWidget {
  final String label;
  final OnNavigationTap onPressed;

  const Button2HomeScreen({
    super.key,
    required this.label,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: AppStyles.machineButtonStyle2.copyWith(
        fixedSize: WidgetStateProperty.all(const Size(300, 80)),
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            softWrap: false,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}


