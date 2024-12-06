import 'package:echo_note/appwrite_model.dart';
import 'package:echo_note/appwrite_service.dart';
import 'package:flutter/material.dart';

class ListExample extends StatefulWidget {
  const ListExample({super.key});

  @override
  State<ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
  late AppwriteService _appwriteService;
  late List<Addlist> _lists;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController listcontroller = TextEditingController();
  late List<String> add = [];

  void newlist() {
    setState(() {
      if (listcontroller.text.isNotEmpty) {
        add.add(listcontroller.text);
        listcontroller.clear();
      }
    });
  }

  void _removeList(int index) {
    setState(() {
      add.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _appwriteService = AppwriteService();
    _lists = [];
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

  Future<void> _addlist() async {
    final Title = titlecontroller.text;
    final List = listcontroller.text;

    if (Title.isNotEmpty && List.isNotEmpty) {
      try {
        await _appwriteService.addLists(Title, List);
        titlecontroller.clear();
        listcontroller.clear();

        _loadlist();
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
            "Add New List",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: _addlist,
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
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.green)),
                    label: Text(
                      "Title",
                      style: TextStyle(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              ),
              SizedBox(height: 20),
              TextField(
                controller: listcontroller,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        newlist();
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    label: Text(
                      "Add to list",
                      style: TextStyle(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: add.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(add[index]),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        _removeList(index);
                                      },
                                      icon: Icon(Icons.cancel))
                                ],
                              )
                            ],
                          ),
                        );
                      }))
            ],
          ),
        ));
  }
}
