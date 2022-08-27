// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_data_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonStatListData _$PokemonStatListDataFromJson(Map<String, dynamic> json) =>
    PokemonStatListData(
      stats: (json['stats'] as List<dynamic>?)
          ?.map((e) => PokemonStatData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonStatListDataToJson(
        PokemonStatListData instance) =>
    <String, dynamic>{
      'stats': instance.stats,
    };

PokemonStatData _$PokemonStatDataFromJson(Map<String, dynamic> json) =>
    PokemonStatData(
      affectingMoves: json['affecting_moves'] == null
          ? null
          : AffectingMoves.fromJson(
              json['affecting_moves'] as Map<String, dynamic>),
      affectingNatures: json['affecting_natures'] == null
          ? null
          : AffectingNatures.fromJson(
              json['affecting_natures'] as Map<String, dynamic>),
      characteristics: (json['characteristics'] as List<dynamic>?)
          ?.map((e) => Characteristic.fromJson(e as Map<String, dynamic>))
          .toList(),
      gameIndex: json['game_index'] as int?,
      id: json['id'] as int?,
      isBattleOnly: json['is_battle_only'] as bool?,
      moveDamageClass: json['move_damage_class'] == null
          ? null
          : MoveDamageClass.fromJson(
              json['move_damage_class'] as Map<String, dynamic>),
      name: json['name'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => Name.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonStatDataToJson(PokemonStatData instance) =>
    <String, dynamic>{
      'affecting_moves': instance.affectingMoves,
      'affecting_natures': instance.affectingNatures,
      'characteristics': instance.characteristics,
      'game_index': instance.gameIndex,
      'id': instance.id,
      'is_battle_only': instance.isBattleOnly,
      'move_damage_class': instance.moveDamageClass,
      'name': instance.name,
      'names': instance.names,
    };

AffectingMoves _$AffectingMovesFromJson(Map<String, dynamic> json) =>
    AffectingMoves(
      decrease: (json['decrease'] as List<dynamic>?)
          ?.map((e) => Crease.fromJson(e as Map<String, dynamic>))
          .toList(),
      increase: (json['increase'] as List<dynamic>?)
          ?.map((e) => Crease.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AffectingMovesToJson(AffectingMoves instance) =>
    <String, dynamic>{
      'decrease': instance.decrease,
      'increase': instance.increase,
    };

Crease _$CreaseFromJson(Map<String, dynamic> json) => Crease(
      change: json['change'] as int?,
      move: json['move'] == null
          ? null
          : MoveDamageClass.fromJson(json['move'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreaseToJson(Crease instance) => <String, dynamic>{
      'change': instance.change,
      'move': instance.move,
    };

MoveDamageClass _$MoveDamageClassFromJson(Map<String, dynamic> json) =>
    MoveDamageClass(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MoveDamageClassToJson(MoveDamageClass instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

AffectingNatures _$AffectingNaturesFromJson(Map<String, dynamic> json) =>
    AffectingNatures(
      decrease: (json['decrease'] as List<dynamic>?)
          ?.map((e) => MoveDamageClass.fromJson(e as Map<String, dynamic>))
          .toList(),
      increase: (json['increase'] as List<dynamic>?)
          ?.map((e) => MoveDamageClass.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AffectingNaturesToJson(AffectingNatures instance) =>
    <String, dynamic>{
      'decrease': instance.decrease,
      'increase': instance.increase,
    };

Characteristic _$CharacteristicFromJson(Map<String, dynamic> json) =>
    Characteristic(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$CharacteristicToJson(Characteristic instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      language: json['language'] == null
          ? null
          : MoveDamageClass.fromJson(json['language'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'language': instance.language,
      'name': instance.name,
    };
