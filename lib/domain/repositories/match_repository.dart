import '../models/match.dart';

abstract class MatchRepository {
  Future<List<Match>> getMatches();
  Future<void> addMatch(Match match);
  Future<void> removeMatch(String id);
}

