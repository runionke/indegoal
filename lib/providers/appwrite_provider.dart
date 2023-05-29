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
    /* 
    when calling this, it will open a second tab, then redirect. 
    the choice is whether to land on a page that instructs the user to close the tab
    or just ignore it. I think the two pages approach seems preferable, because on mobile it's a
    bit awkward to close the extra screen.
    */
    await state.account.createOAuth2Session(
      provider: provider,
      success: 'https://indegoal.com',
      failure: 'https://indegoal.com',
      // success: 'https://indegoal.com/auth/complete',
      // failure: 'https://indegoal.com/auth/complete',
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

  Future<Map<String, dynamic>> read(
      {required DbCollection collectionId, required String id}) async {
    final response = await state.database.getDocument(
      databaseId: AppwriteSettings.databaseId,
      collectionId: collectionId.name,
      documentId: id,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> write({
    required DbCollection collection,
    required String id,
    required,
    required Map<String, dynamic> data,
  }) async {
    final response = await state.database.updateDocument(
      databaseId: AppwriteSettings.databaseId,
      collectionId: collection.name,
      documentId: id,
      data: data,
    );
    return response.data;
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

    //createfiles, await and return the generated file ids
    final uploads = await Future.wait(files.map((e) {
      return storage.createFile(
          bucketId: bucketId,
          fileId: 'unique()',
          file: InputFile.fromBytes(bytes: e, filename: '$user.jpg'));
    }));
    return uploads.map((e) => e.$id);
  }

  ///retrieve image preview adjust with optional [height] and [width]
  Future<Iterable<Uint8List>> previewFromStorage({
    required String bucketId,
    required Iterable<String> items,
    double? height,
    double? width,
  }) async {
    final storage = Storage(state.client);

    final files = Future.wait(items.map((fileId) => storage.getFilePreview(
          bucketId: bucketId,
          fileId: fileId,
          height: height?.toInt(),
          width: width?.toInt(),
        )));
    return files;
  }
}

enum DbCollection {
  events,
  goals,
}
