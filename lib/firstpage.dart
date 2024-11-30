import 'package:echo_note/list.dart';
import 'package:echo_note/task.dart';
import 'package:echo_note/text.dart';
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
              bottom: const TabBar(
                  tabs: [Text("Text"), Text("List"), Text("Task")]),
            ),
            floatingActionButton: _showfab
                ? FloatingActionButton(
                    backgroundColor: Colors.green,
                    onPressed: () {
                      setState(() {
                        _showicon = true;
                        _showfab = false;
                      });
                    },
                    child: Icon(
                      Icons.add,
                    ))
                : null,
            body: Stack(
              children: <Widget>[
                if (_showicon)
                  Positioned(
                    bottom: 80, // Adjust position above FAB
                    right: 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TaskExample()));
                              },
                              icon: Icon(Icons.add_task)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListExample()));
                              },
                              icon: Icon(Icons.check_box_rounded)),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TextExample()));
                              },
                              icon: Icon(Icons.menu)),
                        ),
                      ],
                    ),
                  ),
              ],
            )));
  }
}
