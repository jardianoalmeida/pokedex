import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/lib.dart';

class PokemonCard extends StatelessWidget {
  final String id;
  final String name;
  final String image;

  const PokemonCard({
    super.key,
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: true,
      splashColor: Colors.red[50],
      onTap: () => Modular.to.pushNamed(AppModuleRouting.detail.path, arguments: id),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.grey.withOpacity(0.24),
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '#$id',
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff666666),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Hero(
                      tag: id,
                      child: Image.network(
                        image,
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: 44.0,
                  decoration: BoxDecoration(
                    color: const Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "${name[0].toUpperCase()}${name.substring(1)}",
                    style: const TextStyle(
                      fontSize: 21,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
