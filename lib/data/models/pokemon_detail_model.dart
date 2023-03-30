import '../../domain/domain.dart';

///
/// Pokemon detail model
///
class PokemonDetailModel {
  final String name;
  final String image;
  final List<String> types;
  final double height;
  final double weight;

  ///
  /// Creates new instance of [PokemonDetailModel]
  ///
  PokemonDetailModel({required this.types, required this.name, required this.image, required this.height, required this.weight});

  ///
  /// Creates new [PokemonDetailModel] instance from a map
  ///
  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      types: (json['types'] as List).map((e) => e['type']['name'] as String).toList(),
      name: json['name'] as String,
      image: json['sprites']['other']['official-artwork']['front_default'] as String,
      height: json['height'] + .0 as double,
      weight: json['weight'] + .0 as double,
    );
  }

  ///
  /// Convert [PokemonModel] to [Pokemon] entity
  ///
  PokemonDetail toEntity() {
    return PokemonDetail(
      types: types,
      name: name,
      image: image,
      height: height,
      weight: weight,
    );
  }
}
