import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/presentation/views/detail/detail_viewmodel.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, this.color = Colors.red, required this.id});
  final Color color;
  final String id;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final viewModel = Modular.get<DetailViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.getPokemonDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: widget.color,
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, state) {
          if (viewModel.value.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 20,
                left: 5,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                  top: 70.0,
                  left: 20.0,
                  right: 20.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        viewModel.value.pokemon?.name ?? '',
                        style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '#${widget.id}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )),
              Positioned(
                top: height * .28,
                child: Container(
                  width: width,
                  height: height,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 86.0),
                      SizedBox(
                        height: 40.0,
                        child: ListView.separated(
                          itemCount: (viewModel.value.pokemon?.types ?? []).length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Chip(label: Text(viewModel.value.pokemon?.types[index] ?? ''));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 32.0);
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'About',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Spacer(),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.height_outlined),
                                  Text(
                                    viewModel.value.pokemon?.height.toString() ?? '',
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                'Weight',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.height_outlined),
                                  Text(
                                    viewModel.value.pokemon?.weight.toString() ?? '',
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                'Height',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: height * .15,
                child: Hero(
                  tag: widget.id,
                  child: Image.network(
                    viewModel.value.pokemon?.image ?? '',
                    height: 200,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
