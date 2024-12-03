import 'package:echo_note/appwrite_model.dart';
import 'package:echo_note/appwrite_service.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  late AppwriteService _appwriteService;
  late List<Task> _task;
  final DateTime dateTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    _appwriteService = AppwriteService();
    _task = [];
  }

  Future<void> _loadtask() async {
    try {
      final tasks = await _appwriteService.getTasks();
      setState(() {
        _task = tasks.map((e) => Task.fromDocument(e)).toList();
      });
    } catch (e) {
      print("Title is empty");
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: _task.length,
              itemBuilder: (context, index) {
                final tasks = _task[index];
                return Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 240, 231, 152)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tasks.Title),
                      Text(tasks.Description),
                      Text(tasks.Date),
                      Text(tasks.Time)
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
