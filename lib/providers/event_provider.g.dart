// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventNotifierHash() => r'f4cae4327f7a932002cf480e260c482bbad7c618';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$EventNotifier extends BuildlessAsyncNotifier<Iterable<Event>> {
  late final Goal? goal;

  Future<Iterable<Event>> build({
    Goal? goal,
  });
}

/// See also [EventNotifier].
@ProviderFor(EventNotifier)
const eventNotifierProvider = EventNotifierFamily();

/// See also [EventNotifier].
class EventNotifierFamily extends Family<AsyncValue<Iterable<Event>>> {
  /// See also [EventNotifier].
  const EventNotifierFamily();

  /// See also [EventNotifier].
  EventNotifierProvider call({
    Goal? goal,
  }) {
    return EventNotifierProvider(
      goal: goal,
    );
  }

  @override
  EventNotifierProvider getProviderOverride(
    covariant EventNotifierProvider provider,
  ) {
    return call(
      goal: provider.goal,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'eventNotifierProvider';
}

/// See also [EventNotifier].
class EventNotifierProvider
    extends AsyncNotifierProviderImpl<EventNotifier, Iterable<Event>> {
  /// See also [EventNotifier].
  EventNotifierProvider({
    this.goal,
  }) : super.internal(
          () => EventNotifier()..goal = goal,
          from: eventNotifierProvider,
          name: r'eventNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventNotifierHash,
          dependencies: EventNotifierFamily._dependencies,
          allTransitiveDependencies:
              EventNotifierFamily._allTransitiveDependencies,
        );

  final Goal? goal;

  @override
  bool operator ==(Object other) {
    return other is EventNotifierProvider && other.goal == goal;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, goal.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<Iterable<Event>> runNotifierBuild(
    covariant EventNotifier notifier,
  ) {
    return notifier.build(
      goal: goal,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
