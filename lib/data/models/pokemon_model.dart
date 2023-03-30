import '../../../domain/domain.dart';

const _kPokedexImg = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/";

///
/// Pokemon
///
class PokemonModel {
  final String id;
  final String name;
  final String img;

  ///
  /// Creates new instance of [PokemonModel]
  ///
  PokemonModel({
    required this.id,
    required this.name,
    required this.img,
  });

  ///
  /// Creates new [PokemonModel] instance from a map
  ///
  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    List<String> id = json['url'].split('/');
    return PokemonModel(
      id: id[id.length - 2],
      name: json['name'] as String,
      img: '${_kPokedexImg + id[id.length - 2]}.png',
    );
  }

  ///
  /// Convert [PokemonModel] to [Pokemon] entity
  ///
  Pokemon toEntity() {
    return Pokemon(
      id: id,
      name: name,
      img: img,
    );
  }
}
