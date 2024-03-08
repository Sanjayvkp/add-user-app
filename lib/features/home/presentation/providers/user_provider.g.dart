// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllusersHash() => r'83de7d85aa4e0df16e95879af52897a4adaf8f22';

/// See also [getAllusers].
@ProviderFor(getAllusers)
final getAllusersProvider =
    AutoDisposeStreamProvider<List<UserEntity>>.internal(
  getAllusers,
  name: r'getAllusersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllusersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllusersRef = AutoDisposeStreamProviderRef<List<UserEntity>>;
String _$userHash() => r'c1a52ed6783b9c7655b0aa93d90bbd61c23c72cb';

/// See also [User].
@ProviderFor(User)
final userProvider = NotifierProvider<User, void>.internal(
  User.new,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$User = Notifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
