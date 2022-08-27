import 'package:pokedex_app_flutter/src/src.dart';
import 'package:riverpod/riverpod.dart';

// create pokemon repository provider
final pokemonRepositoryProvider = Provider((_) => PokemonRepository());

final pokemonListProvider = FutureProvider<List>((ref) {
  final repository = ref.watch(pokemonRepositoryProvider);
  Future<List> getPokeList() async {
    final data = await repository.getPokemonList();
    final pokeList = data.results;
    var list = [];

    if (pokeList != null) {
      for (var id in pokeList) {
        final poke = await repository.getPokemonData(id: id.name);

        var results = {
          'name': poke.name,
          'index': poke.id,
          'image': poke.sprites?.frontDefault,
          'type': poke.types?.first.type?.name
        };
        print(results);

        list.add(results);
      }
    }

    return list;
  }

  return getPokeList();
});

// provider to get pokemon data
final pokemonDataProvider =
    FutureProvider.family.autoDispose<PokemonData, String>((ref, pokeId) {
  final repository = ref.watch(pokemonRepositoryProvider);

  Future<PokemonData> getPokeData() async {
    try {
      await Future.delayed(const Duration(seconds: 4));
      return await repository.getPokemonData(id: pokeId);
    } catch (e) {
      rethrow;
    }
  }

  return getPokeData();
});

// provider to get pokemon stat data
final pokemonStatDataProvider =
    FutureProvider.family.autoDispose<PokemonStatData, String>((ref, statUrl) {
  // watch pokemon repository provider
  final repository = ref.watch(pokemonRepositoryProvider);

  Future<PokemonStatData> getPokeStatData() async {
    try {
      await Future.delayed(const Duration(seconds: 4));
      return await repository.getPokemonStatData(statUrl: statUrl);
    } catch (e) {
      rethrow;
    }
  }

  return getPokeStatData();
});

// provider to get pokemon stat list data
final pokemonStatListDataProvider = FutureProvider.family
    .autoDispose<PokemonStatListData, List<String?>>((ref, statUrl) {
  // watch pokemon repository provider
  final repository = ref.watch(pokemonRepositoryProvider);

  Future<PokemonStatListData> getPokeStatListData() async {
    try {
      await Future.delayed(const Duration(seconds: 4));
      final list = statUrl
          .map(
            (e) => ref
                .watch(
                  pokemonStatDataProvider(e!),
                )
                .value,
          )
          .toList();
      return PokemonStatListData(stats: list as List<PokemonStatData>);
    } catch (e) {
      throw 'Failed to get stat list';
    }
  }

  return getPokeStatListData();
});
