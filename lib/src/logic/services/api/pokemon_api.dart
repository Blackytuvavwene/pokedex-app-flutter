import 'package:http/http.dart';

// class to access pokeapi
class PokeApi {
  // pokemon api url
  static const String url = 'https://pokeapi.co/api/v2/';

// get pokemon list
  static Future<T> getPokemonList<T>({
    required String endpoint,
    required T Function(String json) builder,
  }) async {
    final Response response = await get(
      Uri.parse('$url$endpoint/?limit=25'),
    );
    if (response.statusCode != 200) {
      throw response.body;
    }
    return builder(response.body);
  }

// get pokemon data
  static Future<T> getPokemonData<T>({
    required String id,
    required T Function(String json) builder,
  }) async {
    final Response response = await get(
      Uri.parse('${url}pokemon/$id/'),
    );
    if (response.statusCode != 200) {
      throw response.body;
    }
    return builder(response.body);
  }

  // get pokemon stat data
  static Future<T> getPokemonStatData<T>({
    required String statUrl,
    required T Function(String json) builder,
  }) async {
    final Response response = await get(
      Uri.parse(statUrl),
    );
    if (response.statusCode != 200) {
      throw response.body;
    }
    return builder(response.body);
  }
}
