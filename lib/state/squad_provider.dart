import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../domain/models/squad.dart';
import '../domain/repositories/squad_repository.dart';
import 'providers.dart';

final squadProvider = StateNotifierProvider<SquadNotifier, List<Squad>>((ref) {
  return SquadNotifier(ref.read(squadRepositoryProvider));
});

class SquadNotifier extends StateNotifier<List<Squad>> {
  final SquadRepository _repo;
  final _uuid = const Uuid();

  SquadNotifier(this._repo) : super([]) {
    _load();
  }

  void _load() async {
    final squads = await _repo.getSquads();
    state = squads;
  }

  Future<void> addSquad(String name, List<String> playerIds, String captainId) async {
    final squad = Squad(
      id: _uuid.v4(),
      name: name,
      playerIds: playerIds,
      captainId: captainId,
    );
    await _repo.addSquad(squad);
    state = [...state, squad];
  }

  Future<void> updateSquad(Squad updated) async {
    await _repo.addSquad(updated);
    state = [
      for (final s in state)
        if (s.id == updated.id) updated else s,
    ];
  }

  Future<void> removeSquad(String id) async {
    await _repo.removeSquad(id);
    state = state.where((s) => s.id != id).toList();
  }
}

