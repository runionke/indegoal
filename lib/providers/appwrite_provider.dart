import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:indegoal/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appwrite_provider.g.dart';

class AppwriteSettings {
  static String databaseId = 'goaldb';
  static String eventCollection = 'events';
  static String goalCollection = 'goals';
  static String eventImageBucket = 'event_images';
}

@Riverpod(keepAlive: true)
class Appwrite extends _$Appwrite {
  @override
  ({
    Client client,
    Account account,
    Databases database,
  }) build() {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('indegoal');

    final account = Account(client);
    final database = Databases(client);
    return (account: account, client: client, database: database);
  }

  Future<void> oauthSession(String provider) async {
    await state.account.createOAuth2Session(
      provider: provider,
    );
  }

  Future<Iterable<Map<String, dynamic>>> list(
      {required DbCollection collection, List<String>? queries}) async {
    Log.d('AppwriteNotifier-> list');

    final user = await state.account.get();
    final response = await state.database.listDocuments(
      databaseId: AppwriteSettings.databaseId,
      collectionId: collection.name,
      queries: [
        Query.equal('userId', user.$id),
        if (queries != null) ...queries,
      ],
    );
    return response.documents.map((e) => e.data);
  }

  Future<void> create({
    required Map<String, dynamic> data,
    required DbCollection collection,
  }) async {
    Log.d('AppwriteNotifier -> create : $collection');
    final user = await state.account.get();
    data['userId'] = user.$id;
    await state.database.createDocument(
      databaseId: AppwriteSettings.databaseId,
      collectionId: collection.name,
      documentId: ID.unique(),
      data: data,
      permissions: [
        Permission.read(Role.user(user.$id)),
        Permission.write(Role.user(user.$id)),
      ],
    );
  }

  Future<void> delete({
    required String id,
    required DbCollection collection,
  }) async {
    await state.database.deleteDocument(
      databaseId: AppwriteSettings.databaseId,
      collectionId: collection.name,
      documentId: id,
    );
  }

  //upload files to storage bucket and return ids.
  Future<Iterable<String>> uploadToStorage({
    required List<Uint8List> files,
    required String bucketId,
  }) async {
    final storage = Storage(state.client);
    final user = (await state.account.get()).$id;
    final futures = files.map((e) {
      return storage.createFile(
          bucketId: bucketId,
          fileId: 'unique()',
          file: InputFile.fromBytes(bytes: e, filename: '$user.jpg'));
    });
    //await the futures and return the generated file ids
    final stored = await Future.wait(futures);
    return stored.map((e) => e.$id);
  }
}

enum DbCollection {
  events,
  goals,
}
