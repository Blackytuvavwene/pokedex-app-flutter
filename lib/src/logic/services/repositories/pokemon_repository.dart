import 'package:pokedex_app_flutter/src/src.dart';

// abstract class for pokemon repository
abstract class PokemonAbstract {
  Future<PokemonList> getPokemonList();
  Future<PokemonData> getPokemonData({String? id});
}

// pokemon repository class
class PokemonRepository implements PokemonAbstract {
  @override
  Future<PokemonList> getPokemonList() async {
    return await PokeApi.getPokemonList(
      endpoint: 'pokemon',
      builder: (String json) => PokemonDecode.pokeListFromJson(json),
    );
  }

  @override
  Future<PokemonData> getPokemonData({String? id}) async {
    return await PokeApi.getPokemonData(
      id: id!,
      builder: (String json) => PokemonDecode.pokeDataFromJson(json),
    );
  }
}
