import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../widgets/pokemon_card.dart';
import 'home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewModel = Modular.get<HomeViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = (width > 1000)
        ? 5
        : (width > 700)
            ? 4
            : (width > 450)
                ? 3
                : 2;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: const Color(0xffDC0A2D),
        child: AnimatedBuilder(
          animation: viewModel,
          builder: (context, state) {
            if (viewModel.value.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Container(
              color: Colors.white,
              child: GridView.count(
                padding: const EdgeInsets.all(7),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                semanticChildCount: 250,
                childAspectRatio: 200 / 244,
                physics: const BouncingScrollPhysics(),
                children: viewModel.value.pokemons
                    .map(
                      (pokemon) => PokemonCard(
                        id: pokemon.id,
                        name: pokemon.name,
                        image: pokemon.img,
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
