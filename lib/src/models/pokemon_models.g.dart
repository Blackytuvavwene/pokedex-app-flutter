// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonList _$PokemonListFromJson(Map<String, dynamic> json) => PokemonList(
      count: json['count'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
    );

Map<String, dynamic> _$PokemonListToJson(PokemonList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results,
      'next': instance.next,
      'previous': instance.previous,
    };

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

PokemonData _$PokemonDataFromJson(Map<String, dynamic> json) => PokemonData(
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => Ability.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseExperience: json['base_experience'] as int?,
      forms: (json['forms'] as List<dynamic>?)
          ?.map((e) => Species.fromJson(e as Map<String, dynamic>))
          .toList(),
      gameIndices: (json['game_indices'] as List<dynamic>?)
          ?.map((e) => GameIndex.fromJson(e as Map<String, dynamic>))
          .toList(),
      height: json['height'] as int?,
      heldItems: json['held_items'] as List<dynamic>?,
      id: json['id'] as int?,
      isDefault: json['is_default'] as bool?,
      locationAreaEncounters: json['location_area_encounters'] as String?,
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) => Move.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      order: json['order'] as int?,
      pastTypes: json['past_types'] as List<dynamic>?,
      species: json['species'] == null
          ? null
          : Species.fromJson(json['species'] as Map<String, dynamic>),
      sprites: json['sprites'] == null
          ? null
          : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>?)
          ?.map((e) => Stat.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => Types.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight: json['weight'] as int?,
    );

Map<String, dynamic> _$PokemonDataToJson(PokemonData instance) =>
    <String, dynamic>{
      'abilities': instance.abilities,
      'base_experience': instance.baseExperience,
      'forms': instance.forms,
      'game_indices': instance.gameIndices,
      'height': instance.height,
      'held_items': instance.heldItems,
      'id': instance.id,
      'is_default': instance.isDefault,
      'location_area_encounters': instance.locationAreaEncounters,
      'moves': instance.moves,
      'name': instance.name,
      'order': instance.order,
      'past_types': instance.pastTypes,
      'species': instance.species,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'types': instance.types,
      'weight': instance.weight,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      ability: json['ability'] == null
          ? null
          : Species.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool?,
      slot: json['slot'] as int?,
    );

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };

Species _$SpeciesFromJson(Map<String, dynamic> json) => Species(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SpeciesToJson(Species instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

GameIndex _$GameIndexFromJson(Map<String, dynamic> json) => GameIndex(
      gameIndex: json['game_index'] as int?,
      version: json['version'] == null
          ? null
          : Species.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameIndexToJson(GameIndex instance) => <String, dynamic>{
      'game_index': instance.gameIndex,
      'version': instance.version,
    };

Move _$MoveFromJson(Map<String, dynamic> json) => Move(
      move: json['move'] == null
          ? null
          : Species.fromJson(json['move'] as Map<String, dynamic>),
      versionGroupDetails: (json['version_group_details'] as List<dynamic>?)
          ?.map((e) => VersionGroupDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoveToJson(Move instance) => <String, dynamic>{
      'move': instance.move,
      'version_group_details': instance.versionGroupDetails,
    };

VersionGroupDetail _$VersionGroupDetailFromJson(Map<String, dynamic> json) =>
    VersionGroupDetail(
      levelLearnedAt: json['level_learned_at'] as int?,
      moveLearnMethod: json['move_learn_method'] == null
          ? null
          : Species.fromJson(json['move_learn_method'] as Map<String, dynamic>),
      versionGroup: json['version_group'] == null
          ? null
          : Species.fromJson(json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionGroupDetailToJson(VersionGroupDetail instance) =>
    <String, dynamic>{
      'level_learned_at': instance.levelLearnedAt,
      'move_learn_method': instance.moveLearnMethod,
      'version_group': instance.versionGroup,
    };

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      baseStat: json['base_stat'] as int?,
      stat: json['stat'] == null
          ? null
          : Species.fromJson(json['stat'] as Map<String, dynamic>),
      effort: json['effort'] as int?,
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
      'stat': instance.stat,
      'effort': instance.effort,
    };

Types _$TypesFromJson(Map<String, dynamic> json) => Types(
      slot: json['slot'] as int?,
      type: json['type'] == null
          ? null
          : Species.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      backDefault: json['back_default'] as String?,
      backFemale: json['back_female'],
      backShiny: json['back_shiny'] as String?,
      backShinyFemale: json['back_shiny_female'],
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'],
      other: json['other'] == null
          ? null
          : Other.fromJson(json['other'] as Map<String, dynamic>),
      versions: json['versions'] == null
          ? null
          : Versions.fromJson(json['versions'] as Map<String, dynamic>),
      animated: json['animated'] == null
          ? null
          : Sprites.fromJson(json['animated'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
      'other': instance.other,
      'versions': instance.versions,
      'animated': instance.animated,
    };

Other _$OtherFromJson(Map<String, dynamic> json) => Other(
      dreamWorld: json['dream_world'] == null
          ? null
          : DreamWorld.fromJson(json['dream_world'] as Map<String, dynamic>),
      home: json['home'] == null
          ? null
          : Home.fromJson(json['home'] as Map<String, dynamic>),
      officialArtwork: json['official-artwork'] == null
          ? null
          : OfficialArtwork.fromJson(
              json['official-artwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtherToJson(Other instance) => <String, dynamic>{
      'dream_world': instance.dreamWorld,
      'home': instance.home,
      'official-artwork': instance.officialArtwork,
    };

OfficialArtwork _$OfficialArtworkFromJson(Map<String, dynamic> json) =>
    OfficialArtwork(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
    );

Map<String, dynamic> _$OfficialArtworkToJson(OfficialArtwork instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };

DreamWorld _$DreamWorldFromJson(Map<String, dynamic> json) => DreamWorld(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
    );

Map<String, dynamic> _$DreamWorldToJson(DreamWorld instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
    };

Home _$HomeFromJson(Map<String, dynamic> json) => Home(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'],
    );

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };

Versions _$VersionsFromJson(Map<String, dynamic> json) => Versions(
      generationI: json['generation-i'] == null
          ? null
          : GenerationI.fromJson(json['generation-i'] as Map<String, dynamic>),
      generationIi: json['generation-ii'] == null
          ? null
          : GenerationIi.fromJson(
              json['generation-ii'] as Map<String, dynamic>),
      generationIii: json['generation-iii'] == null
          ? null
          : GenerationIii.fromJson(
              json['generation-iii'] as Map<String, dynamic>),
      generationIv: json['generation-iv'] == null
          ? null
          : GenerationIv.fromJson(
              json['generation-iv'] as Map<String, dynamic>),
      generationV: json['generation-v'] == null
          ? null
          : GenerationV.fromJson(json['generation-v'] as Map<String, dynamic>),
      generationVi: json['generation-vi'] == null
          ? null
          : GenerationVi.fromJson(
              json['generation-vi'] as Map<String, dynamic>),
      generationVii: json['generation-vii'] == null
          ? null
          : GenerationVii.fromJson(
              json['generation-vii'] as Map<String, dynamic>),
      generationViii: json['generation-viii'] == null
          ? null
          : GenerationViii.fromJson(
              json['generation-viii'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionsToJson(Versions instance) => <String, dynamic>{
      'generation-i': instance.generationI,
      'generation-ii': instance.generationIi,
      'generation-iii': instance.generationIii,
      'generation-iv': instance.generationIv,
      'generation-v': instance.generationV,
      'generation-vi': instance.generationVi,
      'generation-vii': instance.generationVii,
      'generation-viii': instance.generationViii,
    };

GenerationI _$GenerationIFromJson(Map<String, dynamic> json) => GenerationI(
      redBlue: json['red-blue'] == null
          ? null
          : RedBlue.fromJson(json['red-blue'] as Map<String, dynamic>),
      yellow: json['yellow'] == null
          ? null
          : RedBlue.fromJson(json['yellow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationIToJson(GenerationI instance) =>
    <String, dynamic>{
      'red-blue': instance.redBlue,
      'yellow': instance.yellow,
    };

RedBlue _$RedBlueFromJson(Map<String, dynamic> json) => RedBlue(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
    );

Map<String, dynamic> _$RedBlueToJson(RedBlue instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };

GenerationIi _$GenerationIiFromJson(Map<String, dynamic> json) => GenerationIi(
      silver: json['silver'] == null
          ? null
          : Gold.fromJson(json['silver'] as Map<String, dynamic>),
      gold: json['gold'] == null
          ? null
          : Gold.fromJson(json['gold'] as Map<String, dynamic>),
      crystal: json['crystal'] == null
          ? null
          : Crystal.fromJson(json['crystal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationIiToJson(GenerationIi instance) =>
    <String, dynamic>{
      'silver': instance.silver,
      'gold': instance.gold,
      'crystal': instance.crystal,
    };

Crystal _$CrystalFromJson(Map<String, dynamic> json) => Crystal(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
    );

Map<String, dynamic> _$CrystalToJson(Crystal instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };

GenerationIii _$GenerationIiiFromJson(Map<String, dynamic> json) =>
    GenerationIii(
      rubySapphire: json['ruby-sapphire'] == null
          ? null
          : Gold.fromJson(json['ruby-sapphire'] as Map<String, dynamic>),
      emerald: json['emerald'] == null
          ? null
          : Emerald.fromJson(json['emerald'] as Map<String, dynamic>),
      fireRedLeafGreen: json['firered-leafgreen'] == null
          ? null
          : Gold.fromJson(json['firered-leafgreen'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationIiiToJson(GenerationIii instance) =>
    <String, dynamic>{
      'ruby-sapphire': instance.rubySapphire,
      'emerald': instance.emerald,
      'firered-leafgreen': instance.fireRedLeafGreen,
    };

GenerationIv _$GenerationIvFromJson(Map<String, dynamic> json) => GenerationIv(
      ultraSunUltraMoon: json['ultra-sun-ultra-moon'] == null
          ? null
          : Home.fromJson(json['ultra-sun-ultra-moon'] as Map<String, dynamic>),
      icons: json['icons'] == null
          ? null
          : DreamWorld.fromJson(json['icons'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationIvToJson(GenerationIv instance) =>
    <String, dynamic>{
      'icons': instance.icons,
      'ultra-sun-ultra-moon': instance.ultraSunUltraMoon,
    };

GenerationV _$GenerationVFromJson(Map<String, dynamic> json) => GenerationV(
      blackWhite: json['black-white'] == null
          ? null
          : Sprites.fromJson(json['black-white'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationVToJson(GenerationV instance) =>
    <String, dynamic>{
      'black-white': instance.blackWhite,
    };

GenerationVi _$GenerationViFromJson(Map<String, dynamic> json) => GenerationVi(
      omegaRubyAlphaSapphire: json['omegaruby-alphasappire'] == null
          ? null
          : Home.fromJson(
              json['omegaruby-alphasappire'] as Map<String, dynamic>),
      xy: json['x-y'] == null
          ? null
          : Home.fromJson(json['x-y'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationViToJson(GenerationVi instance) =>
    <String, dynamic>{
      'omegaruby-alphasappire': instance.omegaRubyAlphaSapphire,
      'x-y': instance.xy,
    };

GenerationVii _$GenerationViiFromJson(Map<String, dynamic> json) =>
    GenerationVii(
      icons: json['icons'] == null
          ? null
          : DreamWorld.fromJson(json['icons'] as Map<String, dynamic>),
      ultraSunUltraMoon: json['ultra-sun-ultra-moon'] == null
          ? null
          : Home.fromJson(json['ultra-sun-ultra-moon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationViiToJson(GenerationVii instance) =>
    <String, dynamic>{
      'icons': instance.icons,
      'ultra-sun-ultra-moon': instance.ultraSunUltraMoon,
    };

GenerationViii _$GenerationViiiFromJson(Map<String, dynamic> json) =>
    GenerationViii(
      icons: json['icons'] == null
          ? null
          : DreamWorld.fromJson(json['icons'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationViiiToJson(GenerationViii instance) =>
    <String, dynamic>{
      'icons': instance.icons,
    };

Gold _$GoldFromJson(Map<String, dynamic> json) => Gold(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
      backDefault: json['back_default'] as String?,
      backFemale: json['back_female'] as String?,
      backShiny: json['back_shiny'] as String?,
      backShinyFemale: json['back_shiny_female'] as String?,
    );

Map<String, dynamic> _$GoldToJson(Gold instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
    };

Emerald _$EmeraldFromJson(Map<String, dynamic> json) => Emerald(
      frontDefault: json['front_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
    );

Map<String, dynamic> _$EmeraldToJson(Emerald instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_shiny': instance.frontShiny,
    };
