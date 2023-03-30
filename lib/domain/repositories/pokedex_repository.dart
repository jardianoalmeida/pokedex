import 'package:dartz/dartz.dart';

import '../domain.dart';

///
/// Pokedex repository interface
///
abstract class IPokedexRepository {
  ///
  /// Fetches pokedex
  ///
  Future<Either<PokedexFailure, List<Pokemon>>> getPokemon();

  ///
  /// Fetche especific pokemon
  ///
  Future<Either<PokedexFailure, PokemonDetail>> getDetail(String id);
}
