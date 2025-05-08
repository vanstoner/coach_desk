import '../models/player.dart';

abstract class PlayerRepository {
  Future<List<Player>> getPlayers();
  Future<void> addPlayer(Player player);
  Future<void> removePlayer(String id);
}

