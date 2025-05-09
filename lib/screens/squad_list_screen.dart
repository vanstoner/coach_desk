import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/squad_provider.dart';
import '../domain/models/squad.dart';
import 'squad_detail_screen.dart';

class SquadListScreen extends ConsumerWidget {
  const SquadListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final squads = ref.watch(squadProvider);
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Squads')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: squads.length,
              itemBuilder: (_, index) {
                final squad = squads[index];
                return ListTile(
                  title: Text(squad.name),
                  subtitle: Text('${squad.playerIds.length} players'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SquadDetailScreen(squad: squad),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: 'New Squad Name',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {
                    final name = controller.text.trim();
                    if (name.isNotEmpty) {
                      ref.read(squadProvider.notifier).addSquad(name, [], '');
                      controller.clear();
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

