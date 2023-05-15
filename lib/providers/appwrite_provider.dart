import 'package:appwrite/appwrite.dart';
import 'package:indegoal/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appwrite_provider.g.dart';

class AppwriteSettings {
  static String databaseId = 'goaldb';
  static String eventCollection = 'events';
  static String goalCollection = 'goals';
}

@Riverpod(keepAlive: true)
class Appwrite extends _$Appwrite {
  @override
  ({Client client, Account account, Databases database}) build() {
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
      {required DbCollection collection}) async {
    Log.d('AppwriteNotifier-> list');

    return await ref.watch(authNotifierProvider).when(
          authorized: (user) async {
            final database = ref.watch(appwriteProvider).database;
            final response = await database.listDocuments(
              databaseId: AppwriteSettings.databaseId,
              collectionId: collection.name,
              queries: [Query.equal('userId', user.id)],
            );
            return response.documents.map((e) => e.data);
          },
          unauthorized: () => [],
          loading: () => [],
        );
  }

  Future<void> create({
    required Map<String, dynamic> data,
    required String id,
    required DbCollection collection,
  }) async {
    await ref.watch(authNotifierProvider).when(
          authorized: (user) async {
            final database = ref.watch(appwriteProvider).database;
            await database.createDocument(
              databaseId: AppwriteSettings.databaseId,
              collectionId: collection.name,
              documentId: id,
              data: data,
              permissions: [
                Permission.read(Role.user(user.id)),
                Permission.write(Role.user(user.id)),
              ],
            );
          },
          unauthorized: () {},
          loading: () {},
        );
    ref.invalidateSelf();
  }

  Future<void> delete(
      {required String id, required DbCollection collection}) async {
    await ref.watch(authNotifierProvider).when(
          authorized: (user) async {
            final database = ref.watch(appwriteProvider).database;
            await database.deleteDocument(
              databaseId: AppwriteSettings.databaseId,
              collectionId: collection.name,
              documentId: id,
            );
          },
          unauthorized: () {},
          loading: () {},
        );
    ref.invalidateSelf();
  }
}

enum DbCollection {
  events,
  goals,
}
