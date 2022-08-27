import 'package:pokedex_app_flutter/src/src.dart';

// abstract class for pokemon repository
abstract class PokemonAbstract {
  Future<PokemonList> getPokemonList();
  Future<PokemonData> getPokemonData({String? id});
  Future<PokemonStatData> getPokemonStatData({String? statUrl});
}

// pokemon repository class
class PokemonRepository implements PokemonAbstract {
  // get pokemon list
  @override
  Future<PokemonList> getPokemonList() async {
    return await PokeApi.getPokemonList(
      endpoint: 'pokemon',
      builder: (String json) => PokemonDecode.pokeListFromJson(json),
    );
  }

// get pokemon data
  @override
  Future<PokemonData> getPokemonData({String? id}) async {
    return await PokeApi.getPokemonData(
      id: id!,
      builder: (String json) => PokemonDecode.pokeDataFromJson(json),
    );
  }

  // get pokemon stat data
  @override
  Future<PokemonStatData> getPokemonStatData({String? statUrl}) async {
    return await PokeApi.getPokemonStatData(
      statUrl: statUrl!,
      builder: (String json) => PokemonDataModelsDecoding.decodeStatData(json),
    );
  }
}
