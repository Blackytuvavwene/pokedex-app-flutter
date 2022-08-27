import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pokemon_data_models.g.dart';

class PokemonDataModelsDecoding {
  // Decode the JSON data into a PokemonStatData object
  static PokemonStatData decodeStatData(String jsonData) {
    return PokemonStatData.fromJson(json.decode(jsonData));
  }

  // Encode the PokemonStatData object into JSON data
  static String encodeStatData(PokemonStatData statData) {
    return json.encode(statData);
  }
}

@JsonSerializable()
class PokemonStatListData {
  final List<PokemonStatData>? stats;

  PokemonStatListData({
    this.stats,
  });

  factory PokemonStatListData.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatListDataFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatListDataToJson(this);
}

@JsonSerializable()
class PokemonStatData {
  PokemonStatData({
    this.affectingMoves,
    this.affectingNatures,
    this.characteristics,
    this.gameIndex,
    this.id,
    this.isBattleOnly,
    this.moveDamageClass,
    this.name,
    this.names,
  });

  @JsonKey(name: 'affecting_moves')
  final AffectingMoves? affectingMoves;
  @JsonKey(name: 'affecting_natures')
  final AffectingNatures? affectingNatures;
  final List<Characteristic>? characteristics;
  @JsonKey(name: 'game_index')
  final int? gameIndex;
  final int? id;
  @JsonKey(name: 'is_battle_only')
  final bool? isBattleOnly;
  @JsonKey(name: 'move_damage_class')
  final MoveDamageClass? moveDamageClass;
  final String? name;
  final List<Name>? names;

  factory PokemonStatData.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatDataFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatDataToJson(this);
}

@JsonSerializable()
class AffectingMoves {
  AffectingMoves({
    this.decrease,
    this.increase,
  });

  final List<Crease>? decrease;
  final List<Crease>? increase;

  factory AffectingMoves.fromJson(Map<String, dynamic> json) =>
      _$AffectingMovesFromJson(json);

  Map<String, dynamic> toJson() => _$AffectingMovesToJson(this);
}

@JsonSerializable()
class Crease {
  Crease({
    this.change,
    this.move,
  });

  final int? change;
  final MoveDamageClass? move;

  factory Crease.fromJson(Map<String, dynamic> json) => _$CreaseFromJson(json);

  Map<String, dynamic> toJson() => _$CreaseToJson(this);
}

@JsonSerializable()
class MoveDamageClass {
  MoveDamageClass({
    this.name,
    this.url,
  });

  final String? name;
  final String? url;

  factory MoveDamageClass.fromJson(Map<String, dynamic> json) =>
      _$MoveDamageClassFromJson(json);

  Map<String, dynamic> toJson() => _$MoveDamageClassToJson(this);
}

@JsonSerializable()
class AffectingNatures {
  AffectingNatures({
    this.decrease,
    this.increase,
  });

  final List<MoveDamageClass>? decrease;
  final List<MoveDamageClass>? increase;

  factory AffectingNatures.fromJson(Map<String, dynamic> json) =>
      _$AffectingNaturesFromJson(json);

  Map<String, dynamic> toJson() => _$AffectingNaturesToJson(this);
}

@JsonSerializable()
class Characteristic {
  Characteristic({
    this.url,
  });

  final String? url;

  factory Characteristic.fromJson(Map<String, dynamic> json) =>
      _$CharacteristicFromJson(json);

  Map<String, dynamic> toJson() => _$CharacteristicToJson(this);
}

@JsonSerializable()
class Name {
  Name({
    this.language,
    this.name,
  });

  final MoveDamageClass? language;
  final String? name;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}
