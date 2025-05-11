import 'package:freezed_annotation/freezed_annotation.dart';

part 'match.freezed.dart';
part 'match.g.dart';

enum MatchStatus { planned, ongoing, completed }

@freezed
class Match with _$Match {
  const factory Match({
    required String id,
    required String squadId,
    required DateTime date,
    @Default(MatchStatus.planned) MatchStatus status,
    @Default(4) int quarterCount,
    @Default(10) int quarterDuration, // minutes
  }) = _Match;

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
}

