// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventImagesHash() => r'16ec395f7b0ee7f13896d415b7e9b9acbcf7d422';

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

///accepts [event], or [eventId]
///
/// Copied from [eventImages].
@ProviderFor(eventImages)
const eventImagesProvider = EventImagesFamily();

///accepts [event], or [eventId]
///
/// Copied from [eventImages].
class EventImagesFamily extends Family<AsyncValue<List<Uint8List>>> {
  ///accepts [event], or [eventId]
  ///
  /// Copied from [eventImages].
  const EventImagesFamily();

  ///accepts [event], or [eventId]
  ///
  /// Copied from [eventImages].
  EventImagesProvider call({
    Event? event,
    String? eventId,
    double height = 50,
    double width = 50,
  }) {
    return EventImagesProvider(
      event: event,
      eventId: eventId,
      height: height,
      width: width,
    );
  }

  @override
  EventImagesProvider getProviderOverride(
    covariant EventImagesProvider provider,
  ) {
    return call(
      event: provider.event,
      eventId: provider.eventId,
      height: provider.height,
      width: provider.width,
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

///accepts [event], or [eventId]
///
/// Copied from [eventImages].
class EventImagesProvider extends AutoDisposeFutureProvider<List<Uint8List>> {
  ///accepts [event], or [eventId]
  ///
  /// Copied from [eventImages].
  EventImagesProvider({
    this.event,
    this.eventId,
    this.height = 50,
    this.width = 50,
  }) : super.internal(
          (ref) => eventImages(
            ref,
            event: event,
            eventId: eventId,
            height: height,
            width: width,
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
  final double height;
  final double width;

  @override
  bool operator ==(Object other) {
    return other is EventImagesProvider &&
        other.event == event &&
        other.eventId == eventId &&
        other.height == height &&
        other.width == width;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, event.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);
    hash = _SystemHash.combine(hash, height.hashCode);
    hash = _SystemHash.combine(hash, width.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$eventHash() => r'ee79b8ea8677e387d447b1d739fdd5a9cc1c09d5';
typedef EventRef = AutoDisposeFutureProviderRef<Event>;

///event from [goalId]
///
/// Copied from [event].
@ProviderFor(event)
const eventProvider = EventFamily();

///event from [goalId]
///
/// Copied from [event].
class EventFamily extends Family<AsyncValue<Event>> {
  ///event from [goalId]
  ///
  /// Copied from [event].
  const EventFamily();

  ///event from [goalId]
  ///
  /// Copied from [event].
  EventProvider call({
    required String eventId,
  }) {
    return EventProvider(
      eventId: eventId,
    );
  }

  @override
  EventProvider getProviderOverride(
    covariant EventProvider provider,
  ) {
    return call(
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

///event from [goalId]
///
/// Copied from [event].
class EventProvider extends AutoDisposeFutureProvider<Event> {
  ///event from [goalId]
  ///
  /// Copied from [event].
  EventProvider({
    required this.eventId,
  }) : super.internal(
          (ref) => event(
            ref,
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

  final String eventId;

  @override
  bool operator ==(Object other) {
    return other is EventProvider && other.eventId == eventId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$eventNotifierHash() => r'd6980efbc373d2e63636bba8f9f6881ce408e3c4';

abstract class _$EventNotifier extends BuildlessAsyncNotifier<Iterable<Event>> {
  late final Goal? goal;
  late final DateTime? fromDate;
  late final DateTime? toDate;

  Future<Iterable<Event>> build({
    Goal? goal,
    DateTime? fromDate,
    DateTime? toDate,
  });
}

/// [from] and [to] range take precedent over [goal] range
///
/// Copied from [EventNotifier].
@ProviderFor(EventNotifier)
const eventNotifierProvider = EventNotifierFamily();

/// [from] and [to] range take precedent over [goal] range
///
/// Copied from [EventNotifier].
class EventNotifierFamily extends Family<AsyncValue<Iterable<Event>>> {
  /// [from] and [to] range take precedent over [goal] range
  ///
  /// Copied from [EventNotifier].
  const EventNotifierFamily();

  /// [from] and [to] range take precedent over [goal] range
  ///
  /// Copied from [EventNotifier].
  EventNotifierProvider call({
    Goal? goal,
    DateTime? fromDate,
    DateTime? toDate,
  }) {
    return EventNotifierProvider(
      goal: goal,
      fromDate: fromDate,
      toDate: toDate,
    );
  }

  @override
  EventNotifierProvider getProviderOverride(
    covariant EventNotifierProvider provider,
  ) {
    return call(
      goal: provider.goal,
      fromDate: provider.fromDate,
      toDate: provider.toDate,
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

/// [from] and [to] range take precedent over [goal] range
///
/// Copied from [EventNotifier].
class EventNotifierProvider
    extends AsyncNotifierProviderImpl<EventNotifier, Iterable<Event>> {
  /// [from] and [to] range take precedent over [goal] range
  ///
  /// Copied from [EventNotifier].
  EventNotifierProvider({
    this.goal,
    this.fromDate,
    this.toDate,
  }) : super.internal(
          () => EventNotifier()
            ..goal = goal
            ..fromDate = fromDate
            ..toDate = toDate,
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
  final DateTime? fromDate;
  final DateTime? toDate;

  @override
  bool operator ==(Object other) {
    return other is EventNotifierProvider &&
        other.goal == goal &&
        other.fromDate == fromDate &&
        other.toDate == toDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, goal.hashCode);
    hash = _SystemHash.combine(hash, fromDate.hashCode);
    hash = _SystemHash.combine(hash, toDate.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<Iterable<Event>> runNotifierBuild(
    covariant EventNotifier notifier,
  ) {
    return notifier.build(
      goal: goal,
      fromDate: fromDate,
      toDate: toDate,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
