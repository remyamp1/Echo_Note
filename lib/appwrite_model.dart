import 'package:appwrite/models.dart';

class Task {
  final String id;
  final String Title;
  final String Description;
  final String Date;
  final String Time;

  Task({
    required this.id,
    required this.Title,
    required this.Description,
    required this.Date,
    required this.Time,
  });

  factory Task.fromDocument(Document doc) {
    return Task(
        id: doc.$id,
        Title: doc.data["Title"],
        Description: doc.data['Description'],
        Date: doc.data['Date'],
        Time: doc.data['Time']);
  }
}

class Texts {
  final String id;
  final String Title;
  final String Content;
  final String Date;
  final String Time;

  Texts({
    required this.id,
    required this.Title,
    required this.Content,
    required this.Date,
    required this.Time,
  });

  factory Texts.fromDocument(Document doc) {
    return Texts(
        id: doc.$id,
        Title: doc.data["Title"],
        Content: doc.data['Content'],
        Date: doc.data['Date'],
        Time: doc.data['Time']);
  }
}
