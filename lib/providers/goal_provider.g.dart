// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$goalNotifierHash() => r'fcca88949487ed3dfaaf32de152e61ba7db984ce';

///goals sorted by end date
///
/// Copied from [GoalNotifier].
@ProviderFor(GoalNotifier)
final goalNotifierProvider =
    AsyncNotifierProvider<GoalNotifier, Iterable<Goal>>.internal(
  GoalNotifier.new,
  name: r'goalNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$goalNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GoalNotifier = AsyncNotifier<Iterable<Goal>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
