import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:indegoal/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'route_provider.g.dart';

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
          builder: (context, state, child) => ViewShell(child: child),
          routes: [
            GoRoute(
                path: '/',
                builder: (context, state) => const HomeView(),
                routes: [
                  GoRoute(
                      path: 'hist/:goalId',
                      builder: (context, state) => EventHistoryView(
                            goalId: state.pathParameters['goalId'] ?? '',
                          ),
                      routes: [
                        GoRoute(
                            path: 'event/:eventId',
                            builder: (context, state) => EventEditView(
                                  eventId:
                                      state.pathParameters['eventId'] ?? '',
                                  goalId: state.pathParameters['goalId'] ?? '',
                                )),
                      ]),
                  GoRoute(
                      path: 'export',
                      builder: (context, state) => const ExportPdfView()),
                ]),
            GoRoute(
                path: '/auth',
                builder: (context, state) => const LoginView(),
                routes: [
                  GoRoute(
                    path: 'complete',
                    builder: (context, state) => const AuthComplete(),
                  )
                ]),
            GoRoute(
                path: '/cgoal',
                builder: (context, state) => const CreateGoalView()),
            GoRoute(
                path: '/cevent/:goalId',
                builder: (context, state) => CreateEventView(
                      goalId: state.pathParameters['goalId'] ?? '',
                    )),
          ]),
    ],
  );
}
