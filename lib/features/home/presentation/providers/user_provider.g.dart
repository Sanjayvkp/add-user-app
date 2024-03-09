// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllusersHash() => r'6825cdab80d7354953f4d1811bab7185f9f5ee51';

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
String _$userHash() => r'd9923f9b462dd19dacff7ce66e9253d777485864';

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
