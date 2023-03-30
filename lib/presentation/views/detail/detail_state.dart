import '../../../domain/domain.dart';

/// Detail home state
class DetailState {

  /// Creates an [DetailState]
  const DetailState({
    this.isError = false,
    this.isLoading = false,
    this.pokemon,
  });

  final bool isError;
  final bool isLoading;
  final PokemonDetail? pokemon;

  /// Initial State
  factory DetailState.initial() => const DetailState();


  DetailState copyWith({
    bool? isError,
    bool? isLoading,
    PokemonDetail? pokemon,
  }) {
    return DetailState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      pokemon: pokemon ?? this.pokemon,
    );
  }
}
