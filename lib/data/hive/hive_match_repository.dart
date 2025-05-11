import 'package:hive/hive.dart';
import '../../domain/models/match.dart';
import '../../domain/repositories/match_repository.dart';

class HiveMatchRepository implements MatchRepository {
  static const String boxName = 'matchesBox';

  @override
  Future<List<Match>> getMatches() async {
    final box = await Hive.openBox(boxName);
    return box.values
        .cast<Map>()
        .map((e) => Match.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  @override
  Future<void> addMatch(Match match) async {
    final box = await Hive.openBox(boxName);
    await box.put(match.id, match.toJson());
  }

  @override
  Future<void> removeMatch(String id) async {
    final box = await Hive.openBox(boxName);
    await box.delete(id);
  }
}

