import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/player_provider.dart';
import '../domain/models/player.dart';

class SquadScreen extends ConsumerWidget {
  const SquadScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(playerProvider);

    final nameCtrl = TextEditingController();
    final positionCtrl = TextEditingController();
    final shirtCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Squad')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (_, i) {
                final player = players[i];
                return ListTile(
                  title: Text(
                    player.shirtNumber != null
                        ? '${player.name} (#${player.shirtNumber})'
                        : player.name,
                  ),
                  subtitle: Text(player.preferredPosition),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        tooltip: 'Edit',
                        onPressed: () => _showEditDialog(context, ref, player),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        tooltip: 'Delete',
                        onPressed: () => ref.read(playerProvider.notifier).removePlayer(player.id),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Name')),
              TextField(
                  controller: positionCtrl,
                  decoration: const InputDecoration(labelText: 'Preferred Position')),
              TextField(
                controller: shirtCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Shirt Number (optional)'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(playerProvider.notifier).addPlayer(
                        nameCtrl.text,
                        positionCtrl.text,
                        shirtCtrl.text.isEmpty ? null : int.tryParse(shirtCtrl.text),
                      );
                  nameCtrl.clear();
                  positionCtrl.clear();
                  shirtCtrl.clear();
                },
                child: const Text('Add Player'),
              ),
            ]),
          )
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context, WidgetRef ref, Player player) {
    final nameCtrl = TextEditingController(text: player.name);
    final positionCtrl = TextEditingController(text: player.preferredPosition);
    final shirtCtrl = TextEditingController(
      text: player.shirtNumber?.toString() ?? '',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Player'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Name')),
            TextField(
                controller: positionCtrl,
                decoration: const InputDecoration(labelText: 'Preferred Position')),
            TextField(
              controller: shirtCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Shirt Number (optional)'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(playerProvider.notifier).updatePlayer(
                    player.id,
                    nameCtrl.text,
                    positionCtrl.text,
                    shirtCtrl.text.isEmpty ? null : int.tryParse(shirtCtrl.text),
                  );
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
