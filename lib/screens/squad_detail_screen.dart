import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/squad.dart';
import '../state/player_provider.dart';
import '../state/squad_provider.dart';

class SquadDetailScreen extends ConsumerStatefulWidget {
  final Squad squad;

  const SquadDetailScreen({super.key, required this.squad});

  @override
  ConsumerState<SquadDetailScreen> createState() => _SquadDetailScreenState();
}

class _SquadDetailScreenState extends ConsumerState<SquadDetailScreen> {
  late String captainId;
  late List<String> selectedPlayerIds;

  @override
  void initState() {
    super.initState();
    captainId = widget.squad.captainId;
    selectedPlayerIds = List.from(widget.squad.playerIds);
  }

  @override
  Widget build(BuildContext context) {
    final allPlayers = ref.watch(playerProvider);
    final squadNotifier = ref.read(squadProvider.notifier);

    final playerMap = {
      for (final p in allPlayers) p.id: p,
    };

    return Scaffold(
      appBar: AppBar(title: Text(widget.squad.name)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Players:', style: TextStyle(fontSize: 16)),
            Expanded(
              child: ListView(
                children: allPlayers.map((player) {
                  final isSelected = selectedPlayerIds.contains(player.id);
                  return CheckboxListTile(
                    value: isSelected,
                    title: Text(player.name),
                    subtitle: Text(player.preferredPosition),
                    onChanged: (checked) {
                      setState(() {
                        if (checked == true) {
                          selectedPlayerIds.add(player.id);
                        } else {
                          selectedPlayerIds.remove(player.id);
                          if (captainId == player.id) {
                            captainId = '';
                          }
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12),
            const Text('Select Captain:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              isExpanded: true,
              value:
                  captainId.isNotEmpty && selectedPlayerIds.contains(captainId) ? captainId : null,
              items: selectedPlayerIds
                  .map((id) => DropdownMenuItem<String>(
                        value: id,
                        child: Text(playerMap[id]?.name ?? ''),
                      ))
                  .toList(),
              onChanged: (id) {
                setState(() {
                  captainId = id!;
                });
              },
            ),
            const SizedBox(height: 12),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Save Squad'),
                onPressed: () {
                  final updated = widget.squad.copyWith(
                    playerIds: selectedPlayerIds,
                    captainId: captainId,
                  );
                  squadNotifier.updateSquad(updated);
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
