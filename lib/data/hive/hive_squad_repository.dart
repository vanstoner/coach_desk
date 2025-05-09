import 'package:hive/hive.dart';
import '../../domain/models/squad.dart';
import '../../domain/repositories/squad_repository.dart';

class HiveSquadRepository implements SquadRepository {
  static const String boxName = 'squadsBox';

  @override
  Future<List<Squad>> getSquads() async {
    final box = await Hive.openBox(boxName);
    return box.values
        .cast<Map>()
        .map((e) => Squad.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  @override
  Future<void> addSquad(Squad squad) async {
    final box = await Hive.openBox(boxName);
    await box.put(squad.id, squad.toJson());
  }

  @override
  Future<void> removeSquad(String id) async {
    final box = await Hive.openBox(boxName);
    await box.delete(id);
  }
}

