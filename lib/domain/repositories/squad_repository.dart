import '../models/squad.dart';

abstract class SquadRepository {
  Future<List<Squad>> getSquads();
  Future<void> addSquad(Squad squad);
  Future<void> removeSquad(String id);
}

