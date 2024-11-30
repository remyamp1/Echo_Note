import 'package:flutter/material.dart';

class TextExample extends StatefulWidget {
  const TextExample({super.key});

  @override
  State<TextExample> createState() => _TextExampleState();
}

class _TextExampleState extends State<TextExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Page")),
    );
  }
}
