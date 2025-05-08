import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../domain/models/player.dart';
import '../domain/repositories/player_repository.dart';
import 'providers.dart';

final squadProvider = StateNotifierProvider<SquadNotifier, List<Player>>((ref) {
  return SquadNotifier(ref.read(playerRepositoryProvider));
});

class SquadNotifier extends StateNotifier<List<Player>> {
  final PlayerRepository _repo;
  final _uuid = const Uuid();

  SquadNotifier(this._repo) : super([]) {
    _load();
  }

  void _load() async {
    final players = await _repo.getPlayers();
    state = players;
  }

  Future<void> addPlayer(String name, String position, int? shirtNumber) async {
    final player = Player(
      id: _uuid.v4(),
      name: name,
      preferredPosition: position,
      shirtNumber: shirtNumber,
    );
    await _repo.addPlayer(player);
    state = [...state, player];
  }

  Future<void> updatePlayer(String id, String name, String position, int? shirtNumber) async {
    final updated = Player(
      id: id,
      name: name,
      preferredPosition: position,
      shirtNumber: shirtNumber,
    );
    await _repo.addPlayer(updated);
    state = [
      for (final p in state)
        if (p.id == id) updated else p,
    ];
  }

  Future<void> removePlayer(String id) async {
    await _repo.removePlayer(id);
    state = state.where((p) => p.id != id).toList();
  }
}

