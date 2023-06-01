// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeNotifierHash() => r'e229fea23fd8633331c4b5ad47ed61f4097ebe55';

///Allows access to theme outside of context, like reporting.
///Provides a means to update state of theme (light / dark)
///
/// Copied from [ThemeNotifier].
@ProviderFor(ThemeNotifier)
final themeNotifierProvider =
    NotifierProvider<ThemeNotifier, ThemeData>.internal(
  ThemeNotifier.new,
  name: r'themeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeNotifier = Notifier<ThemeData>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
