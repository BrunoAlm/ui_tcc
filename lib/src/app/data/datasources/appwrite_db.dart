// ignore_for_file: avoid_print
import 'package:appwrite/appwrite.dart';
import 'package:uitcc/src/app/domain/entities/equipment_model.dart';
import 'package:uitcc/src/app/data/datasources/appwrite_auth.dart';

class AppwriteDB {
  final AppwriteAuth _appwrite;
  final String databaseId;
  final String documentsCollectionId;
  final String userPrefsCollectionId;
  late Databases database = Databases(_appwrite.client);
  AppwriteDB(this._appwrite, this.databaseId, this.documentsCollectionId,
      this.userPrefsCollectionId);

  Future<void> createDocument(Map data) async {
    print('Creating document with data: $data');
    await database.createDocument(
      databaseId: databaseId,
      collectionId: documentsCollectionId,
      documentId: ID.unique(),
      data: data,
    );
    print('Document created');
  }

  Future<List<EquipmentModel>> listDocuments() async {
    print("listDocuments()");
    var result = await database.listDocuments(
      databaseId: databaseId,
      collectionId: documentsCollectionId,
    );
    print(
        "listDocuments() - result: ${result.documents.map((e) => e.data['name'])}");

    List<EquipmentModel> parse = [];
    result.documents.asMap().forEach((key, value) {
      parse.add(EquipmentModel.fromMap(value.data));
    });

    print("listDocuments() - parse: ${parse.map((e) => e.name)}");
    return parse;
  }

  Future deleteDocument(String documentId) async {
    print(
        'Deleting document $documentId from collection $documentsCollectionId in database $databaseId');
    await database.deleteDocument(
      databaseId: databaseId,
      collectionId: documentsCollectionId,
      documentId: documentId,
    );
    print(
        'Document $documentId deleted from collection $documentsCollectionId in database $databaseId');
  }

  Future<void> updateDocument(
      {required String document, required Map<String, dynamic> data}) async {
    print('Updating document: $document');
    await database.updateDocument(
      databaseId: databaseId,
      collectionId: documentsCollectionId,
      documentId: document,
      data: data,
    );
    print('Document updated: $document');
  }
}
