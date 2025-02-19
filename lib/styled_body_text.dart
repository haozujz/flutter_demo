import 'package:flutter/material.dart';

class StyledBodyText extends StatelessWidget {
  const StyledBodyText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.brown[900],
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

//TODO: This code is only for demonstration purposes

Widget greetingText(String name) {
  return Text("Hello $name");
}

String greet() {
  debugPrint("Hello World");
  return "Hello World";
}
