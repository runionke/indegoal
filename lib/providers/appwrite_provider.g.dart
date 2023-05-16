// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appwrite_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appwriteHash() => r'774cbaad2c014dc69f94450c5243aa773b5ef5a2';

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
