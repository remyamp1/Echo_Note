import 'package:appwrite/models.dart';

class Task {
  final String id;
  final String Title;
  final String Description;
 

  Task({
    required this.id,
    required this.Title,
    required this.Description,
  
  });

  factory Task.fromDocument(Document doc) {
    return Task(
        id: doc.$id,
        Title: doc.data["Title"],
        Description: doc.data['Description'],
    );
  }
}