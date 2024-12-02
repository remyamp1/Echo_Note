import 'package:flutter/material.dart';

class ListExample extends StatefulWidget {
  const ListExample({super.key});

  @override
  State<ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController listcontroller = TextEditingController();
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
                    suffixIcon: Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                    border: OutlineInputBorder(),
                    label: Text(
                      "Add to list",
                      style: TextStyle(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              ),

              SizedBox(height: 10,),
              Expanded(child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context,index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                  children: [
                    Text('')
                  ],
                  ),
                );
              }))
            ],
          ),
        ));
  }
}
