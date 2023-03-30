///
/// Pokemon detail
///
class PokemonDetail {
  final List<String> types;
  final String name;
  final String image;
  final double height;
  final double weight;

  /// Creates an [PokemonDetail]
  PokemonDetail({
    required this.types,
    required this.name,
    required this.image,
    required this.height,
    required this.weight,
  });
}
