import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/domain.dart';

///Abstraction for capture especific pokedex data
abstract class IGetPokemonDetailsUsecase {
  /// Returns a future that resolves to either [PokedexFailure] or [Pokedex]
  Future<Either<PokedexFailure, PokemonDetail>> call(String id);
}

///Use case to get the especific pokedex information
class GetPokemonDetailsUsecase implements IGetPokemonDetailsUsecase {
  final IPokedexRepository _repository;

  ///Create instance of [GetPokemonDetailsUsecase]
  GetPokemonDetailsUsecase(this._repository);

  @override
  Future<Either<PokedexFailure, PokemonDetail>> call(String id) {
    return _repository.getDetail(id);
  }
}
