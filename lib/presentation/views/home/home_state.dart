import 'package:equatable/equatable.dart';

import '../../../domain/domain.dart';

/// Create home state
class HomeState extends Equatable {

  /// Creates an [HomeState]
  const HomeState({
    this.isError = false,
    this.isLoading = false,
    this.pokemons = const [],
  });

  final bool isError;
  final bool isLoading;
  final List<Pokemon> pokemons;

  /// Initial State
  factory HomeState.initial() => const HomeState();

  HomeState copyWith({
    bool? isError,
    bool? isLoading,
    List<Pokemon>? pokemons,
  }) {
    return HomeState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      pokemons: pokemons ?? this.pokemons,
    );
  }

  @override
  List<Object> get props => [isError, isLoading, pokemons];
}
