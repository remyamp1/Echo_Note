import 'package:flutter/material.dart';
class TaskExample extends StatefulWidget {
  const TaskExample({super.key});

  @override
  State<TaskExample> createState() => _TaskExampleState();
}

class _TaskExampleState extends State<TaskExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
        Text("Page"),
      ),
    );
  }
}