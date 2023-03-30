import 'package:flutter/material.dart';

import '../../../domain/usecases/get_pokemon_details_usecase.dart';
import 'detail_state.dart';

class DetailViewModel extends ValueNotifier<DetailState> {
  final IGetPokemonDetailsUsecase _getPokemonDetailsUsecase;
  DetailViewModel(this._getPokemonDetailsUsecase) : super(DetailState.initial());

  Future<void> getPokemonDetail(String id) async {
    value = value.copyWith(isLoading: true);

    final response = await _getPokemonDetailsUsecase(id);

    final newState = response.fold(
      (error) => value.copyWith(isError: true),
      (pokemon) => value.copyWith(pokemon: pokemon),
    );

    value = newState.copyWith(isLoading: false);
  }
}
