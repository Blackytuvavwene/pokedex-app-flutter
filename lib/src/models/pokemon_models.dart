import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pokemon_models.g.dart';

// class to encode and decode pokemon classes json data
class PokemonDecode {
  // convert pokemon list class data to json string
  static pokeListToJson(PokemonList pokemon) => jsonEncode(
        pokemon.toJson(),
      );

  // convert pokemon list json data to pokemon list class map
  static pokeListFromJson(String pokeJson) => PokemonList.fromJson(
        jsonDecode(pokeJson),
      );

  // convert pokemon data class to json string
  static pokeDataToJson(PokemonData pokemon) => jsonEncode(
        pokemon.toJson(),
      );

  // convert pokemon json data to pokemon data class map
  static pokeDataFromJson(String pokemon) => PokemonData.fromJson(
        jsonDecode(pokemon),
      );
}

// class to get the pokemon list data from the api
@JsonSerializable()
class PokemonList {
  final int? count;
  final List<Pokemon>? results;
  final String? next;
  final String? previous;

  PokemonList({
    this.count,
    this.results,
    this.next,
    this.previous,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) =>
      _$PokemonListFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListToJson(this);
}

// class to parse the json data from pokemon list class
@JsonSerializable()
class Pokemon {
  final String? name;
  final String? url;

  Pokemon({
    this.name,
    this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

// class to get the pokemon data of single pokemon from the api
@JsonSerializable()
class PokemonData {
  final List<Ability>? abilities;
  @JsonKey(name: 'base_experience')
  final int? baseExperience;
  final List<Species>? forms;
  @JsonKey(name: 'game_indices')
  final List<GameIndex>? gameIndices;
  final int? height;
  @JsonKey(name: 'held_items')
  final List<dynamic>? heldItems;
  final int? id;
  @JsonKey(name: 'is_default')
  final bool? isDefault;
  @JsonKey(name: 'location_area_encounters')
  final String? locationAreaEncounters;
  final List<Move>? moves;
  final String? name;
  final int? order;
  @JsonKey(name: 'past_types')
  final List<dynamic>? pastTypes;
  final Species? species;
  final Sprites? sprites;
  final List<Stat>? stats;
  final List<Types>? types;
  final int? weight;

  PokemonData({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  factory PokemonData.fromJson(Map<String, dynamic> json) =>
      _$PokemonDataFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDataToJson(this);
}

// class to get pokemon abilities data from the api
@JsonSerializable()
class Ability {
  final Species? ability;
  @JsonKey(name: 'is_hidden')
  final bool? isHidden;
  final int? slot;

  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

// class to get pokemon species data from the api
@JsonSerializable()
class Species {
  final String? name;
  final String? url;

  Species({
    this.name,
    this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}

// class to get pokemon game index data from the api
@JsonSerializable()
class GameIndex {
  @JsonKey(name: 'game_index')
  final int? gameIndex;
  final Species? version;

  GameIndex({
    this.gameIndex,
    this.version,
  });

  factory GameIndex.fromJson(Map<String, dynamic> json) =>
      _$GameIndexFromJson(json);

  Map<String, dynamic> toJson() => _$GameIndexToJson(this);
}

// class to get pokemon move data from the api
@JsonSerializable()
class Move {
  final Species? move;
  @JsonKey(name: 'version_group_details')
  final List<VersionGroupDetail>? versionGroupDetails;

  Move({
    this.move,
    this.versionGroupDetails,
  });

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);
}

// class to get pokemon version group details data from the api
@JsonSerializable()
class VersionGroupDetail {
  @JsonKey(name: 'level_learned_at')
  final int? levelLearnedAt;
  @JsonKey(name: 'move_learn_method')
  final Species? moveLearnMethod;
  @JsonKey(name: 'version_group')
  final Species? versionGroup;

  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      _$VersionGroupDetailFromJson(json);

  Map<String, dynamic> toJson() => _$VersionGroupDetailToJson(this);
}

// class to get pokemon stat data from the api
@JsonSerializable()
class Stat {
  @JsonKey(name: 'base_stat')
  final int? baseStat;
  final Species? stat;
  final int? effort;

  Stat({
    this.baseStat,
    this.stat,
    this.effort,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);
}

// class to get pokemon type data from the api
@JsonSerializable()
@JsonValue('type')
class Types {
  final int? slot;
  final Species? type;

  Types({
    this.slot,
    this.type,
  });

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);

  Map<String, dynamic> toJson() => _$TypesToJson(this);
}

// class to get pokemon sprites data from the api
@JsonSerializable()
class Sprites {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_female')
  final dynamic backFemale;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_shiny_female')
  final dynamic backShinyFemale;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final dynamic frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final dynamic frontShinyFemale;
  final Other? other;
  final Versions? versions;
  final Sprites? animated;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

// class to get pokemon other data from the api
@JsonSerializable()
class Other {
  @JsonKey(name: 'dream_world')
  final DreamWorld? dreamWorld;
  final Home? home;
  @JsonKey(name: 'official-artwork')
  final OfficialArtwork? officialArtwork;

  Other({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

  Map<String, dynamic> toJson() => _$OtherToJson(this);
}

// class to get pokemon official artwork data from the api
@JsonSerializable()
class OfficialArtwork {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  OfficialArtwork({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtworkToJson(this);
}

// class to get pokemon dream world data from the api
@JsonSerializable()
class DreamWorld {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;

  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  factory DreamWorld.fromJson(Map<String, dynamic> json) =>
      _$DreamWorldFromJson(json);

  Map<String, dynamic> toJson() => _$DreamWorldToJson(this);
}

// class to get pokemon home data from the api
@JsonSerializable()
class Home {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final dynamic frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final dynamic frontShinyFemale;

  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);

  Map<String, dynamic> toJson() => _$HomeToJson(this);
}

// class to get pokemon versions data from the api
@JsonSerializable()
class Versions {
  @JsonKey(name: 'generation-i')
  final GenerationI? generationI;
  @JsonKey(name: 'generation-ii')
  final GenerationIi? generationIi;
  @JsonKey(name: 'generation-iii')
  final GenerationIii? generationIii;
  @JsonKey(name: 'generation-iv')
  final GenerationIv? generationIv;
  @JsonKey(name: 'generation-v')
  final GenerationV? generationV;
  @JsonKey(name: 'generation-vi')
  final GenerationVi? generationVi;
  @JsonKey(name: 'generation-vii')
  final GenerationVii? generationVii;
  @JsonKey(name: 'generation-viii')
  final GenerationViii? generationViii;

  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  factory Versions.fromJson(Map<String, dynamic> json) =>
      _$VersionsFromJson(json);

  Map<String, dynamic> toJson() => _$VersionsToJson(this);
}

// class to get pokemon generation i data from the api
@JsonSerializable()
@JsonValue('generation-i')
class GenerationI {
  @JsonKey(name: 'red-blue')
  final RedBlue? redBlue;

  final RedBlue? yellow;

  GenerationI({
    this.redBlue,
    this.yellow,
  });

  factory GenerationI.fromJson(Map<String, dynamic> json) =>
      _$GenerationIFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIToJson(this);
}

// class to get pokemon red blue data from the api
@JsonSerializable()
@JsonValue('red-blue')
class RedBlue {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  RedBlue({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory RedBlue.fromJson(Map<String, dynamic> json) =>
      _$RedBlueFromJson(json);

  Map<String, dynamic> toJson() => _$RedBlueToJson(this);
}

// class to get pokemon generation ii data from the api
@JsonSerializable()
@JsonValue('generation-ii')
class GenerationIi {
  final Gold? silver;
  final Gold? gold;
  final Crystal? crystal;

  GenerationIi({
    this.silver,
    this.gold,
    this.crystal,
  });

  factory GenerationIi.fromJson(Map<String, dynamic> json) =>
      _$GenerationIiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIiToJson(this);
}

// class to get pokemon crystal data from the api
@JsonSerializable()
@JsonValue('crystal')
class Crystal {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  Crystal({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Crystal.fromJson(Map<String, dynamic> json) =>
      _$CrystalFromJson(json);

  Map<String, dynamic> toJson() => _$CrystalToJson(this);
}

// class to get pokemon generation iii data from the api
@JsonSerializable()
@JsonValue('generation-iii')
class GenerationIii {
  @JsonKey(name: 'ruby-sapphire')
  final Gold? rubySapphire;
  final Emerald? emerald;
  @JsonKey(name: 'firered-leafgreen')
  final Gold? fireRedLeafGreen;

  GenerationIii({
    this.rubySapphire,
    this.emerald,
    this.fireRedLeafGreen,
  });

  factory GenerationIii.fromJson(Map<String, dynamic> json) =>
      _$GenerationIiiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIiiToJson(this);
}

// class to get pokemon generation iv data from the api
@JsonSerializable()
@JsonValue('generation-iv')
class GenerationIv {
  final DreamWorld? icons;
  @JsonKey(name: 'ultra-sun-ultra-moon')
  final Home? ultraSunUltraMoon;

  GenerationIv({
    this.ultraSunUltraMoon,
    this.icons,
  });

  factory GenerationIv.fromJson(Map<String, dynamic> json) =>
      _$GenerationIvFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIvToJson(this);
}

// class to get pokemon generation v data from the api
@JsonSerializable()
@JsonValue('generation-v')
class GenerationV {
  @JsonKey(name: 'black-white')
  final Sprites? blackWhite;

  GenerationV({
    this.blackWhite,
  });

  factory GenerationV.fromJson(Map<String, dynamic> json) =>
      _$GenerationVFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationVToJson(this);
}

// class to get pokemon generation vi data from the api
@JsonSerializable()
@JsonValue('generation-vi')
class GenerationVi {
  @JsonKey(name: 'omegaruby-alphasappire')
  final Home? omegaRubyAlphaSapphire;
  @JsonKey(name: 'x-y')
  final Home? xy;

  GenerationVi({
    this.omegaRubyAlphaSapphire,
    this.xy,
  });

  factory GenerationVi.fromJson(Map<String, dynamic> json) =>
      _$GenerationViFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationViToJson(this);
}

// class to get pokemon generation vii data from the api
@JsonSerializable()
@JsonValue('generation-vii')
class GenerationVii {
  final DreamWorld? icons;
  @JsonKey(name: 'ultra-sun-ultra-moon')
  final Home? ultraSunUltraMoon;

  GenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });

  factory GenerationVii.fromJson(Map<String, dynamic> json) =>
      _$GenerationViiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationViiToJson(this);
}

// class to get pokemon generation viii data from the api
@JsonSerializable()
@JsonValue('generation-viii')
class GenerationViii {
  final DreamWorld? icons;

  GenerationViii({
    this.icons,
  });

  factory GenerationViii.fromJson(Map<String, dynamic> json) =>
      _$GenerationViiiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationViiiToJson(this);
}

// class to get pokemon gold data from the api
@JsonSerializable()
class Gold {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_female')
  final String? backFemale;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_shiny_female')
  final String? backShinyFemale;

  Gold({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => _$GoldFromJson(json);

  Map<String, dynamic> toJson() => _$GoldToJson(this);
}

// class to get pokemon emerald data from the api
@JsonSerializable()
class Emerald {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  Emerald({
    this.frontDefault,
    this.frontShiny,
  });

  factory Emerald.fromJson(Map<String, dynamic> json) =>
      _$EmeraldFromJson(json);

  Map<String, dynamic> toJson() => _$EmeraldToJson(this);
}
