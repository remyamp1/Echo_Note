import 'package:echo_note/appwrite_model.dart';
import 'package:echo_note/appwrite_service.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late AppwriteService _appwriteService;
  late List<Addlist> _lists;

  @override
  void initState() {
    super.initState();
    _appwriteService = AppwriteService();
    _lists = [];
    _loadlist();
  }

  Future<void> _loadlist() async {
    try {
      final tasks = await _appwriteService.getLists();
      setState(() {
        _lists = tasks.map((e) => Addlist.fromDocument(e)).toList();
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
                  itemCount: _lists.length,
                  itemBuilder: (context, index) {
                    final texts = _lists[index];
                    return Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 231, 162, 243)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(texts.Title),
                              Text(texts.List),
                            ]),
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
