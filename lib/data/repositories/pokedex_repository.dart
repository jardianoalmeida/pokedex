import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/domain.dart';
import '../data.dart';

///
/// Pokedex repository interface
///
class PokedexRepository implements IPokedexRepository {
  /// The datasource of pokedex
  final IPokedexDatasource _datasource;

  PokedexRepository(this._datasource);

  @override
  Future<Either<PokedexFailure, List<Pokemon>>> getPokemon() async {
    try {
      final response = await _datasource.listPokemon();

      return Right(response.map<Pokemon>((e) => e.toEntity()).toList());
    } on DioError {
      return const Left(PokedexFailure());
    }
  }

  @override
  Future<Either<PokedexFailure, PokemonDetail>> getDetail(String id) async {
    try {
      final response = await _datasource.getDetails(id);

      return Right(response.toEntity());
    } on DioError {
      return const Left(PokedexFailure());
    }
  }
}
