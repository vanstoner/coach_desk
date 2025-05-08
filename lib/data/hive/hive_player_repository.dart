import 'package:hive/hive.dart';
import '../../domain/models/player.dart';
import '../../domain/repositories/player_repository.dart';

class HivePlayerRepository implements PlayerRepository {
  static const String boxName = 'playersBox';

  @override
  Future<List<Player>> getPlayers() async {
    final box = await Hive.openBox(boxName);
    final list = box.values.cast<Map>().map((e) => Player.fromJson(Map<String, dynamic>.from(e))).toList();
    return list;
  }

  @override
  Future<void> addPlayer(Player player) async {
    final box = await Hive.openBox(boxName);
    await box.put(player.id, player.toJson());
  }

  @override
  Future<void> removePlayer(String id) async {
    final box = await Hive.openBox(boxName);
    await box.delete(id);
  }
}

