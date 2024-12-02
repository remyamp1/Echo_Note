import 'package:flutter/material.dart';

class TaskExample extends StatefulWidget {
  const TaskExample({super.key});

  @override
  State<TaskExample> createState() => _TaskExampleState();
}

class _TaskExampleState extends State<TaskExample> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  final DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Add New Task",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              TextField(
                controller: titlecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      "Title",
                      style: TextStyle(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              ),
              SizedBox(height: 20),
              TextField(
                controller: descriptioncontroller,
                maxLines: 20,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      "Description",
                      style: TextStyle(color: Colors.green),
                    ),
                    alignLabelWithHint: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    "${dateTime.day.toString()}-${dateTime.month.toString()}-${dateTime.year.toString()}",
                    style: TextStyle(color: Colors.green),
                  ),
                  Spacer(),
                  Text("${dateTime.hour.toString()}:${dateTime.minute}",
                      style: TextStyle(color: Colors.green))
                ],
              ),
            ],
          ),
        ));
  }
}
