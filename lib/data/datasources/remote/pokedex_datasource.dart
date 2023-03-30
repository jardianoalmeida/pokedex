import 'package:dio/dio.dart';

import '../../data.dart';

/// A datasource of Pokedex Client Api
abstract class IPokedexDatasource {
  /// List all pokemons
  Future<List<PokemonModel>> listPokemon();

  Future<PokemonDetailModel> getDetails(String id);
}

/// [PokedexDatasource] with http adpter
class PokedexDatasource implements IPokedexDatasource {
  static const String _basePath = 'https://pokeapi.co/api/v2';

  ///Http Client
  final Dio httpClient;

  ///Creates a [PokedexDatasource]
  PokedexDatasource(this.httpClient);

  @override
  Future<List<PokemonModel>> listPokemon() async {
    final response = await httpClient.get('$_basePath/pokemon?limit=250');
    final data = response.data['results'] as List;

    return data.map<PokemonModel>((json) => PokemonModel.fromJson(json)).toList();
  }

  @override
  Future<PokemonDetailModel> getDetails(String id) async {
    final response = await httpClient.get('$_basePath/pokemon/1/');

    return PokemonDetailModel.fromJson(response.data);
  }
}
