import 'package:flutter/material.dart';

class EchoNote extends StatefulWidget {
  const EchoNote({super.key});

  @override
  State<EchoNote> createState() => _EchoNoteState();
}

class _EchoNoteState extends State<EchoNote> {
  bool _showicon = false;
  bool _showfab = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Echo Note",
            style: TextStyle(color: Colors.white),
          ),
          bottom:
              const TabBar(tabs: [Text("Text"), Text("List"), Text("Task")]),
        ),
        body: Column(
          children: [],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {},
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
