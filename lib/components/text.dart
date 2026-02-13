import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  const TextExample
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: const Column(
        children: [
          Spacer(),
          Text('Hello from TextExample component!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Spacer(),
          Text('Hello from TextExample component!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Spacer(),
        ]
      ),
    );
  }
}