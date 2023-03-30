import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/data.dart';
import 'domain/domain.dart';
import 'domain/usecases/get_pokemon_details_usecase.dart';
import 'presentation/views/detail/detail_viewmodel.dart';
import 'presentation/views/home/home_viewmodel.dart';

/// Base App module bindings
class AppModuleBindings {
  ///
  /// Base App bindings
  ///
  static List<Bind> get binds => [
        ..._dataSources,
        ..._repositories,
        ..._useCases,
        ..._viewModels,
      ];

  static List<Bind> get _dataSources => [
        Bind.lazySingleton<IPokedexDatasource>(
          (di) => PokedexDatasource(
            Dio(),
          ),
        ),
      ];

  static List<Bind> get _repositories => [
        Bind.factory<IPokedexRepository>(
          (di) => PokedexRepository(
            di.get<IPokedexDatasource>(),
          ),
        ),
      ];

  static final List<Bind> _useCases = [
    Bind.factory<IGetPokemonUseCase>(
      (di) => GetPokemonUseCase(di.get<IPokedexRepository>()),
    ),
    Bind.factory<IGetPokemonDetailsUsecase>(
      (di) => GetPokemonDetailsUsecase(di.get<IPokedexRepository>()),
    ),
  ];

  static List<Bind> get _viewModels => [
        Bind.lazySingleton<HomeViewModel>(
          (di) => HomeViewModel(
            di.get<IGetPokemonUseCase>(),
          ),
        ),
        Bind.lazySingleton<DetailViewModel>(
          (di) => DetailViewModel(
            di.get<IGetPokemonDetailsUsecase>(),
          ),
        ),
      ];
}
