import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/hive/hive_player_repository.dart';
import '../data/hive/hive_squad_repository.dart';
import '../domain/repositories/player_repository.dart';
import '../domain/repositories/squad_repository.dart';
import '../data/hive/hive_match_repository.dart';
import '../domain/repositories/match_repository.dart';

final playerRepositoryProvider = Provider<PlayerRepository>((ref) {
  return HivePlayerRepository();
});

final squadRepositoryProvider = Provider<SquadRepository>((ref) {
  return HiveSquadRepository();
});

final matchRepositoryProvider = Provider<MatchRepository>((ref) {
  return HiveMatchRepository();
});

