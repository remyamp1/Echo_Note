import 'package:flutter/material.dart';
class EditText extends StatefulWidget {
  const EditText({super.key});

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
   TextEditingController titlecontroller = TextEditingController();
  TextEditingController contentcontroller = TextEditingController();
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
            IconButton(onPressed: (){}, icon: Icon(Icons.check,color: Colors.white,))
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