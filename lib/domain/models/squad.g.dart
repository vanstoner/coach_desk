// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'squad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SquadImpl _$$SquadImplFromJson(Map<String, dynamic> json) => _$SquadImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      playerIds:
          (json['playerIds'] as List<dynamic>).map((e) => e as String).toList(),
      captainId: json['captainId'] as String,
    );

Map<String, dynamic> _$$SquadImplToJson(_$SquadImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'playerIds': instance.playerIds,
      'captainId': instance.captainId,
    };
