import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/domain.dart';

///Abstraction for capture pokedex data
abstract class IGetPokemonUseCase {
  /// Returns a future that resolves to either [PokedexFailure] or [Pokedex]
  Future<Either<PokedexFailure, List<Pokemon>>> call();
}

///Use case to get the pokedex information
class GetPokemonUseCase implements IGetPokemonUseCase {
  final IPokedexRepository _repository;

  ///Create instance of [GetPokemonUseCase]
  GetPokemonUseCase(this._repository);

  @override
  Future<Either<PokedexFailure, List<Pokemon>>> call() {
    return _repository.getPokemon();
  }
}
