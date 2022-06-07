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

// class PokeListState extends StateNotifier<AsyncValue<List>> {
//   PokeListState() : super(const AsyncValue.loading());
// final _repository = ref.read(pokemonRepositoryProvider);

//   Future<void> getPokeList() async {
//     state = AsyncLoading();

//     state = AsyncValue.guard(() => _h.getPokeList());
//   }
// }
