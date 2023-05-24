// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appwrite_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appwriteHash() => r'1ca19123cf092411d1b6d1ef155d3353e8be76c7';

/// See also [Appwrite].
@ProviderFor(Appwrite)
final appwriteProvider = NotifierProvider<Appwrite,
    ({Account account, Client client, Databases database})>.internal(
  Appwrite.new,
  name: r'appwriteProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appwriteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Appwrite
    = Notifier<({Account account, Client client, Databases database})>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
