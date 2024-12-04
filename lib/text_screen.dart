import 'package:echo_note/appwrite_model.dart';
import 'package:echo_note/appwrite_service.dart';
import 'package:flutter/material.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({super.key});

  @override
  State<TextScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TextScreen> {
  late AppwriteService _appwriteService;
  late List<Texts> _text;

  final DateTime dateTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    _appwriteService = AppwriteService();
    _text = [];
    _loadtext();
  }

  Future<void> _loadtext() async {
    try {
      final tasks = await _appwriteService.getTasks();
      setState(() {
        _text = tasks.map((e) => Texts.fromDocument(e)).toList();
      });
    } catch (e) {
      print("Title is empty");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7),
                  itemCount: _text.length,
                  itemBuilder: (context, index) {
                    final tasks = _text[index];
                    return Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tasks.Title),
                            Text(tasks.Content),
                            Text(tasks.Date),
                            Text(tasks.Time),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
