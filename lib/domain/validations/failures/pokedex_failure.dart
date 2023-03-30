///
/// Pokedex module failures
///
class PokedexFailure {
  const PokedexFailure();

  ///
  /// Server unexpected failure
  ///
  factory PokedexFailure.server() => const PokedexFailure();

  ///
  /// Request timeout failure
  ///
  factory PokedexFailure.timeout() => const PokedexFailure();

  ///
  /// Unexpected failure
  ///
  factory PokedexFailure.unexpected() => const PokedexFailure();
}
