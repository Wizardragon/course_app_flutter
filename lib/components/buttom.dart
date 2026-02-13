import 'package:flutter/material.dart';

class ButtomExample extends StatelessWidget {
  const ButtomExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: Column(
            children: [
              Spacer(),
              ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),
              Spacer(),
              TextButton(onPressed: null, child: Text('Text Button')),
              Spacer(), 
            ]
          ),
        ),
      Center(
          child: Column(
            children: [
              Spacer(),
              ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),
              Spacer(),
              TextButton(onPressed: null, child: Text('Text Button')),
              Spacer(), 
            ]
          ),
        ),
      ],  
    );
  }
}