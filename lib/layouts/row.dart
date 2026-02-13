import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             Text('Hola gordo puto pero en horizontal', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 10)),
             Expanded(flex:2, child: Text('Hola gordo puto pero en horizontal', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 10))),
             Text('Hola gordo puto pero en horizontal', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 10)),
          ],
        ),
      ),
    );
  }
}