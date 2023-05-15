import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:go_router/go_router.dart';
import 'package:indegoal/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'route_provider.g.dart';

//final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    //navigatorKey: _rootNavigatorKey,
    redirect: (context, state) async {
      Log.d('GoRouter location: ${state.location} ');
      return ref.watch(authNotifierProvider).when(loading: () async {
        Log.d('GoRouter auth state loading');
        await Future.delayed(const Duration(seconds: 5));
        return null;
      }, authorized: (user) {
        Log.d('GoRouter auth state authorized');
        return null;
      }, unauthorized: () {
        Log.d('GoRouter auth state unauthorized');
        if (state.location.contains('register') ||
            state.location.contains('auth')) {
          return null;
        }
        return '/auth';
      });
    },
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => Portal(child: child),
          routes: [
            GoRoute(path: '/', builder: (context, state) => const HomeView()),
            GoRoute(
                path: '/auth', builder: (context, state) => const LoginView()),
            GoRoute(
                path: '/cgoal',
                builder: (context, state) => const CreateGoalView()),
            // ShellRoute(builder: (context, state, child) => child, routes: [
            //   GoRoute(
            //       path: '/builder/zones',
            //       builder: (context, state) => const ZoneView()),
            //   GoRoute(
            //       path: '/builder/room',
            //       builder: (context, state) => const RoomView()),
            // ]),
          ]),
    ],
  );
}