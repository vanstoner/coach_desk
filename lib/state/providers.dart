import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/hive/hive_player_repository.dart';
import '../domain/repositories/player_repository.dart';

final playerRepositoryProvider = Provider<PlayerRepository>((ref) {
  return HivePlayerRepository();
});

