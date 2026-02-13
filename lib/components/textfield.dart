import 'package:flutter/material.dart';

class TextFieldExample extends StatelessWidget {
  const TextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 100, left: 60, right:60),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
              hintText: "Enter your Name",
              labelText: 'Enter your Name',
            ),
          ),         
        ),
        Padding(
          padding: EdgeInsets.only(top: 100, left: 60, right:60),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.mail),
              hintText: "Enter your Email",
              labelText: 'Enter your Email',
            ),
          ),         
        ),
        Padding(
          padding: EdgeInsets.only(top: 100, left: 60, right:60),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.password),
              hintText: "Enter your password",
              labelText: 'Enter your Password',
            ),
          ),         
        ),
      ],
    );
  }
}