import 'package:freezed_annotation/freezed_annotation.dart';

part 'squad.freezed.dart';
part 'squad.g.dart';

@freezed
class Squad with _$Squad {
  const factory Squad({
    required String id,
    required String name,
    required List<String> playerIds,
    required String captainId,
  }) = _Squad;

  factory Squad.fromJson(Map<String, dynamic> json) => _$SquadFromJson(json);
}

