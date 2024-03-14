// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllusersHash() => r'f928e74af26e7b0c9c3ce65b7384044fe075975c';

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

/// See also [getAllusers].
@ProviderFor(getAllusers)
const getAllusersProvider = GetAllusersFamily();

/// See also [getAllusers].
class GetAllusersFamily extends Family<AsyncValue<List<UserEntity>>> {
  /// See also [getAllusers].
  const GetAllusersFamily();

  /// See also [getAllusers].
  GetAllusersProvider call(
    int limit,
    String lastDoc,
  ) {
    return GetAllusersProvider(
      limit,
      lastDoc,
    );
  }

  @override
  GetAllusersProvider getProviderOverride(
    covariant GetAllusersProvider provider,
  ) {
    return call(
      provider.limit,
      provider.lastDoc,
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
  String? get name => r'getAllusersProvider';
}

/// See also [getAllusers].
class GetAllusersProvider extends AutoDisposeStreamProvider<List<UserEntity>> {
  /// See also [getAllusers].
  GetAllusersProvider(
    int limit,
    String lastDoc,
  ) : this._internal(
          (ref) => getAllusers(
            ref as GetAllusersRef,
            limit,
            lastDoc,
          ),
          from: getAllusersProvider,
          name: r'getAllusersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllusersHash,
          dependencies: GetAllusersFamily._dependencies,
          allTransitiveDependencies:
              GetAllusersFamily._allTransitiveDependencies,
          limit: limit,
          lastDoc: lastDoc,
        );

  GetAllusersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.lastDoc,
  }) : super.internal();

  final int limit;
  final String lastDoc;

  @override
  Override overrideWith(
    Stream<List<UserEntity>> Function(GetAllusersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllusersProvider._internal(
        (ref) => create(ref as GetAllusersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        lastDoc: lastDoc,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<UserEntity>> createElement() {
    return _GetAllusersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllusersProvider &&
        other.limit == limit &&
        other.lastDoc == lastDoc;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, lastDoc.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAllusersRef on AutoDisposeStreamProviderRef<List<UserEntity>> {
  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `lastDoc` of this provider.
  String get lastDoc;
}

class _GetAllusersProviderElement
    extends AutoDisposeStreamProviderElement<List<UserEntity>>
    with GetAllusersRef {
  _GetAllusersProviderElement(super.provider);

  @override
  int get limit => (origin as GetAllusersProvider).limit;
  @override
  String get lastDoc => (origin as GetAllusersProvider).lastDoc;
}

String _$userHash() => r'79a16408af8bd6695a2abea6dc22208195f489f5';

/// See also [User].
@ProviderFor(User)
final userProvider = NotifierProvider<User, UserProviderState>.internal(
  User.new,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$User = Notifier<UserProviderState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
