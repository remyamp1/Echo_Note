import 'package:echo_note/appwrite_model.dart';
import 'package:echo_note/appwrite_service.dart';
import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  final String id;
  final String Title;
  final String Content;
  const EditText({
    super.key,
    required this.id,
    required this.Title,
    required this.Content,
  });

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  late AppwriteService _appwriteService;
  late List<Texts> _text;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController contentcontroller = TextEditingController();

  final DateTime dateTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    _appwriteService = AppwriteService();
    _text = [];
  }

  Future<void> _addtext() async {
    final Title = titlecontroller.text;
    final Description = contentcontroller.text;

    String date = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    String time = "${dateTime.hour}/${dateTime.minute}";

    if (Title.isNotEmpty && Description.isNotEmpty) {
      try {
        await _appwriteService.addText(Title, Description, date, time);
        titlecontroller.clear();
        contentcontroller.clear();
      } catch (e) {
        print("Error adding task:$e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Edit Note",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: _addtext,
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
              controller: contentcontroller,
              maxLines: 20,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    "Content",
                    style: TextStyle(color: Colors.green),
                  ),
                  alignLabelWithHint: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
            )
          ],
        ),
      ),
    );
  }
}
