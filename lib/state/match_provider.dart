import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../domain/models/match.dart';
import '../domain/repositories/match_repository.dart';
import 'providers.dart';

final matchProvider = StateNotifierProvider<MatchNotifier, List<Match>>((ref) {
  return MatchNotifier(ref.read(matchRepositoryProvider));
});

class MatchNotifier extends StateNotifier<List<Match>> {
  final MatchRepository _repo;
  final _uuid = const Uuid();

  MatchNotifier(this._repo) : super([]) {
    _load();
  }

  Future<void> _load() async {
    final matches = await _repo.getMatches();
    state = matches;
  }

  Future<void> addMatch({
    required String squadId,
    required DateTime date,
    MatchStatus status = MatchStatus.planned,
    int quarterCount = 4,
    int quarterDuration = 10,
  }) async {
    final match = Match(
      id: _uuid.v4(),
      squadId: squadId,
      date: date,
      status: status,
      quarterCount: quarterCount,
      quarterDuration: quarterDuration,
    );
    await _repo.addMatch(match);
    state = [...state, match];
  }

  Future<void> updateMatch(Match updated) async {
    await _repo.addMatch(updated); // overwrite by ID
    state = [
      for (final m in state)
        if (m.id == updated.id) updated else m,
    ];
  }

  Future<void> removeMatch(String id) async {
    await _repo.removeMatch(id);
    state = state.where((m) => m.id != id).toList();
  }
}

