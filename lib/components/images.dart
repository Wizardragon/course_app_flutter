import 'package:flutter/material.dart';

class ImageExample extends StatelessWidget {
  const ImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: ListView(
        children: [
          Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            width: 200,
            height: 200,
          ),
          Image.network(
            'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
          ),
          Image.asset('assets/images/flutter_team.png'),
        ],
      ),
    );
  }
}
