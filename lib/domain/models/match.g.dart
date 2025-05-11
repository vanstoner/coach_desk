// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchImpl _$$MatchImplFromJson(Map<String, dynamic> json) => _$MatchImpl(
      id: json['id'] as String,
      squadId: json['squadId'] as String,
      date: DateTime.parse(json['date'] as String),
      status: $enumDecodeNullable(_$MatchStatusEnumMap, json['status']) ??
          MatchStatus.planned,
      quarterCount: (json['quarterCount'] as num?)?.toInt() ?? 4,
      quarterDuration: (json['quarterDuration'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$$MatchImplToJson(_$MatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'squadId': instance.squadId,
      'date': instance.date.toIso8601String(),
      'status': _$MatchStatusEnumMap[instance.status]!,
      'quarterCount': instance.quarterCount,
      'quarterDuration': instance.quarterDuration,
    };

const _$MatchStatusEnumMap = {
  MatchStatus.planned: 'planned',
  MatchStatus.ongoing: 'ongoing',
  MatchStatus.completed: 'completed',
};
