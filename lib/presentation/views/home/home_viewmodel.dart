import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import 'home_state.dart';

class HomeViewModel extends ValueNotifier<HomeState> {
  final IGetPokemonUseCase _getPokemonUseCase;
  HomeViewModel(this._getPokemonUseCase) : super(HomeState.initial());

  Future<void> getPokemon() async {
    value = value.copyWith(isLoading: true);

    final response = await _getPokemonUseCase();

    final newState = response.fold(
      (error) => value.copyWith(isError: true),
      (pokemons) => value.copyWith(pokemons: pokemons),
    );

    value = newState.copyWith(isLoading: false);
  }
}
