import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class AppwriteService {
  late Client client;
  late Databases databases;

  static const endpoint = "https://cloud.appwrite.io/v1";
  static const projectId = "674d58350038714332d9";
  static const databaseId = "674d58b3000a8e87d128";
  static const taskcollectionId = "674d58c4001c94b00eaf";
  static const textcollectionId = "674d5968000749948a62";
  static const listcollectionId = "674d592300129f8ddb49";
  AppwriteService() {
    client = Client();
    client.setEndpoint(endpoint);
    client.setProject(projectId);
    databases = Databases(client);
  }
// taskcollection function
  Future<List<Document>> getTasks() async {
    try {
      final result = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: taskcollectionId,
      );
      return result.documents;
    } catch (e) {
      print("error loading tasks:$e");
      rethrow;
    }
  }

  Future<Document> addTask(
      String Title, String Description, String Date, String Time) async {
    try {
      final documentId = ID.unique();
      final result = await databases.createDocument(
        databaseId: databaseId,
        collectionId: taskcollectionId,
        data: {
          'Title': Title,
          'Description': Description,
          'Date': Date,
          'Time': Time
        },
        documentId: documentId,
      );
      return result;
    } catch (e) {
      print('Error creating task:$e');
      rethrow;
    }
  }

  Future<void> deleteTask(String documentId) async {
    try {
      await databases.deleteDocument(
          databaseId: databaseId,
          collectionId: taskcollectionId,
          documentId: documentId);
    } catch (e) {
      print("error deleting task:$e");
      rethrow;
    }
  }

// textcollection function
  Future<List<Document>> getTexts() async {
    try {
      final result = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: textcollectionId,
      );
      return result.documents;
    } catch (e) {
      print("error loading tasks:$e");
      rethrow;
    }
  }

  Future<Document> addText(
      String Title, String Content, String Date, String Time) async {
    try {
      final documentId = ID.unique();
      final result = await databases.createDocument(
        databaseId: databaseId,
        collectionId: textcollectionId,
        data: {'Title': Title, 'Content': Content, 'Date': Date, 'Time': Time},
        documentId: documentId,
      );
      return result;
    } catch (e) {
      print('Error creating task:$e');
      rethrow;
    }
  }

  Future<void> deleteText(String documentId) async {
    try {
      await databases.deleteDocument(
          databaseId: databaseId,
          collectionId: textcollectionId,
          documentId: documentId);
    } catch (e) {
      print("error deleting task:$e");
      rethrow;
    }
  }

  // Listcollection function
  Future<List<Document>> getLists() async {
    try {
      final result = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: listcollectionId,
      );
      return result.documents;
    } catch (e) {
      print("error loading tasks:$e");
      rethrow;
    }
  }

  Future<Document> addLists(
      String Title, String List, String Date, String Time) async {
    try {
      final documentId = ID.unique();
      final result = await databases.createDocument(
        databaseId: databaseId,
        collectionId: listcollectionId,
        data: {'Title': Title, 'List': List, 'Date': Date, 'Time': Time},
        documentId: documentId,
      );
      return result;
    } catch (e) {
      print('Error creating task:$e');
      rethrow;
    }
  }

  Future<void> deleteLists(String documentId) async {
    try {
      await databases.deleteDocument(
          databaseId: databaseId,
          collectionId: listcollectionId,
          documentId: documentId);
    } catch (e) {
      print("error deleting task:$e");
      rethrow;
    }
  }
}
