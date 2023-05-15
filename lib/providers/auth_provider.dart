import 'package:indegoal/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  Auth build() {
    Log.d('AuthNotifier-> build');

    AsyncValue.guard(() async {
      final user = await ref.watch(appwriteProvider).account.get();
      Log.d('AuthNotifier: Build: User: ${user.email}');
      state = Auth.authorized(User(id: user.$id, email: user.email));
    }).then((value) {
      //appwrite will throw an unauthorized error when trying to get the user when
      //not logged in. This is ok.
      if (value.hasError) {
        Log.d('AuthNotifier: build error: ${value.error}');
        state = const Auth.unauthorized();
      }
    });
    return const Auth.loading();
  }

  Future<void> googleAuth() async {
    Log.d('authProvider->googleAuth');
    ref.watch(appwriteProvider.notifier).oauthSession('google');
    Log.d('authProvider->googleAuth->invalidateSelf');
    //awaiting authsession seems to last duration of the session.
    //this delay gives the auth time to complete before trying to get user

    await Future.delayed(const Duration(seconds: 3));
    ref.invalidateSelf();
  }

  Future<void> logout() async {
    await ref.watch(appwriteProvider).account.deleteSessions();
    ref.invalidateSelf();
  }
}
