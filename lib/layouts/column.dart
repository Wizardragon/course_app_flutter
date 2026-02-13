import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Hola gordo puto', style: TextStyle(color: Colors.white, fontSize: 50)),
          Text('Hola gordo puto', style: TextStyle(color: Colors.white, fontSize: 50)),
          Text('Hola gordo puto', style: TextStyle(color: Colors.white, fontSize: 50)),
          Text('Hola gordo puto', style: TextStyle(color: Colors.white, fontSize: 50)),
                ],
      ),
    );
  }
}