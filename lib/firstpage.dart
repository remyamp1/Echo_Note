import 'package:echo_note/list.dart';
import 'package:echo_note/task.dart';
import 'package:echo_note/task_screen.dart';
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

  Widget showIcons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 50),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 13, 209, 19),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Icon(Icons.add_task),
            color: Colors.black,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TaskExample()));
            },
          ),
        ),
        SizedBox(height: 20), // Add spacing between containers
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 13, 209, 19),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Icon(Icons.check_box_rounded),
            color: Colors.black,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListExample()));
            },
          ),
        ),
        SizedBox(height: 20), // Add spacing between containers
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 13, 209, 19),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TextExample()));
            },
          ),
        ),
      ],
    );
  }

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
            body: Stack(children: <Widget>[
              TabBarView(children: [
                Center(child: Text("Text Screen")),
                Center(child: Text("List Screen")),
                TaskScreen(),
              ]),
              if (_showicon)
                Positioned(
                  bottom: 80, // Adjust position above FAB
                  right: 15,
                  child: showIcons(),
                ),
            ])));
  }
}
