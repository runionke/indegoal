// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventImagesHash() => r'0efa8c9825093c347e9e573b110b3ac1e4f7a48e';

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

typedef EventImagesRef = AutoDisposeFutureProviderRef<List<Uint8List>>;

///accepts [event], or [eventId] and [goalId]
///
/// Copied from [eventImages].
@ProviderFor(eventImages)
const eventImagesProvider = EventImagesFamily();

///accepts [event], or [eventId] and [goalId]
///
/// Copied from [eventImages].
class EventImagesFamily extends Family<AsyncValue<List<Uint8List>>> {
  ///accepts [event], or [eventId] and [goalId]
  ///
  /// Copied from [eventImages].
  const EventImagesFamily();

  ///accepts [event], or [eventId] and [goalId]
  ///
  /// Copied from [eventImages].
  EventImagesProvider call({
    Event? event,
    String? eventId,
    String? goalId,
  }) {
    return EventImagesProvider(
      event: event,
      eventId: eventId,
      goalId: goalId,
    );
  }

  @override
  EventImagesProvider getProviderOverride(
    covariant EventImagesProvider provider,
  ) {
    return call(
      event: provider.event,
      eventId: provider.eventId,
      goalId: provider.goalId,
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
  String? get name => r'eventImagesProvider';
}

///accepts [event], or [eventId] and [goalId]
///
/// Copied from [eventImages].
class EventImagesProvider extends AutoDisposeFutureProvider<List<Uint8List>> {
  ///accepts [event], or [eventId] and [goalId]
  ///
  /// Copied from [eventImages].
  EventImagesProvider({
    this.event,
    this.eventId,
    this.goalId,
  }) : super.internal(
          (ref) => eventImages(
            ref,
            event: event,
            eventId: eventId,
            goalId: goalId,
          ),
          from: eventImagesProvider,
          name: r'eventImagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventImagesHash,
          dependencies: EventImagesFamily._dependencies,
          allTransitiveDependencies:
              EventImagesFamily._allTransitiveDependencies,
        );

  final Event? event;
  final String? eventId;
  final String? goalId;

  @override
  bool operator ==(Object other) {
    return other is EventImagesProvider &&
        other.event == event &&
        other.eventId == eventId &&
        other.goalId == goalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, event.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);
    hash = _SystemHash.combine(hash, goalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$eventHash() => r'bd4ff11935b01bbbf559496aa65b8297c7888f29';
typedef EventRef = AutoDisposeFutureProviderRef<Event>;

///event from [goalId] and [eventId] - throws exception if not found
///
/// Copied from [event].
@ProviderFor(event)
const eventProvider = EventFamily();

///event from [goalId] and [eventId] - throws exception if not found
///
/// Copied from [event].
class EventFamily extends Family<AsyncValue<Event>> {
  ///event from [goalId] and [eventId] - throws exception if not found
  ///
  /// Copied from [event].
  const EventFamily();

  ///event from [goalId] and [eventId] - throws exception if not found
  ///
  /// Copied from [event].
  EventProvider call({
    required String goalId,
    required String eventId,
  }) {
    return EventProvider(
      goalId: goalId,
      eventId: eventId,
    );
  }

  @override
  EventProvider getProviderOverride(
    covariant EventProvider provider,
  ) {
    return call(
      goalId: provider.goalId,
      eventId: provider.eventId,
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
  String? get name => r'eventProvider';
}

///event from [goalId] and [eventId] - throws exception if not found
///
/// Copied from [event].
class EventProvider extends AutoDisposeFutureProvider<Event> {
  ///event from [goalId] and [eventId] - throws exception if not found
  ///
  /// Copied from [event].
  EventProvider({
    required this.goalId,
    required this.eventId,
  }) : super.internal(
          (ref) => event(
            ref,
            goalId: goalId,
            eventId: eventId,
          ),
          from: eventProvider,
          name: r'eventProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventHash,
          dependencies: EventFamily._dependencies,
          allTransitiveDependencies: EventFamily._allTransitiveDependencies,
        );

  final String goalId;
  final String eventId;

  @override
  bool operator ==(Object other) {
    return other is EventProvider &&
        other.goalId == goalId &&
        other.eventId == eventId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, goalId.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$eventNotifierHash() => r'1bc6d43230fef572d4fcd02b523f8f51fafb2364';

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
