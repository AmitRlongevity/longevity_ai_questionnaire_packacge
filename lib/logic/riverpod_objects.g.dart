// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riverpod_objects.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchCalculationResultsHash() =>
    r'ce9b0cc747b28750e65dfc825984407b0dae2a65';

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

/// See also [fetchCalculationResults].
@ProviderFor(fetchCalculationResults)
const fetchCalculationResultsProvider = FetchCalculationResultsFamily();

/// See also [fetchCalculationResults].
class FetchCalculationResultsFamily
    extends Family<AsyncValue<CalculationResults>> {
  /// See also [fetchCalculationResults].
  const FetchCalculationResultsFamily();

  /// See also [fetchCalculationResults].
  FetchCalculationResultsProvider call(
    PatientDetails details,
  ) {
    return FetchCalculationResultsProvider(
      details,
    );
  }

  @override
  FetchCalculationResultsProvider getProviderOverride(
    covariant FetchCalculationResultsProvider provider,
  ) {
    return call(
      provider.details,
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
  String? get name => r'fetchCalculationResultsProvider';
}

/// See also [fetchCalculationResults].
class FetchCalculationResultsProvider
    extends AutoDisposeFutureProvider<CalculationResults> {
  /// See also [fetchCalculationResults].
  FetchCalculationResultsProvider(
    PatientDetails details,
  ) : this._internal(
          (ref) => fetchCalculationResults(
            ref as FetchCalculationResultsRef,
            details,
          ),
          from: fetchCalculationResultsProvider,
          name: r'fetchCalculationResultsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCalculationResultsHash,
          dependencies: FetchCalculationResultsFamily._dependencies,
          allTransitiveDependencies:
              FetchCalculationResultsFamily._allTransitiveDependencies,
          details: details,
        );

  FetchCalculationResultsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.details,
  }) : super.internal();

  final PatientDetails details;

  @override
  Override overrideWith(
    FutureOr<CalculationResults> Function(FetchCalculationResultsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCalculationResultsProvider._internal(
        (ref) => create(ref as FetchCalculationResultsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        details: details,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CalculationResults> createElement() {
    return _FetchCalculationResultsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCalculationResultsProvider && other.details == details;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, details.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchCalculationResultsRef
    on AutoDisposeFutureProviderRef<CalculationResults> {
  /// The parameter `details` of this provider.
  PatientDetails get details;
}

class _FetchCalculationResultsProviderElement
    extends AutoDisposeFutureProviderElement<CalculationResults>
    with FetchCalculationResultsRef {
  _FetchCalculationResultsProviderElement(super.provider);

  @override
  PatientDetails get details =>
      (origin as FetchCalculationResultsProvider).details;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
