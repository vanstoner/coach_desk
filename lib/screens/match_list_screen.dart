import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/squad.dart';
import '../state/match_provider.dart';
import '../state/squad_provider.dart';
import '../screens/match_detail_screen.dart';
import '../utils/date_helpers.dart';

class MatchListScreen extends ConsumerStatefulWidget {
  const MatchListScreen({super.key});

  @override
  ConsumerState<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends ConsumerState<MatchListScreen> {
  String? selectedSquadId;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final matches = ref.watch(matchProvider)..sort((a, b) => a.date.compareTo(b.date));
    final squads = ref.watch(squadProvider);

    return Scaffold(
        appBar: AppBar(title: const Text('Matches')),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/images/blank.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: matches.length,
                    itemBuilder: (_, index) {
                      final match = matches[index];
                      final squad = squads.firstWhere((s) => s.id == match.squadId,
                          orElse: () =>
                              const Squad(id: '', name: 'Unknown', playerIds: [], captainId: ''));
                      return ListTile(
                        title: Text(squad.name),
                        subtitle: Text('${formatMatchDate(match.date)} — ${match.status.name}'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MatchDetailScreen(matchID: match.id),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      DropdownButton<String>(
                        isExpanded: true,
                        value: selectedSquadId,
                        hint: const Text('Select Squad'),
                        items: squads.map((s) {
                          return DropdownMenuItem(
                            value: s.id,
                            child: Text(s.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() => selectedSquadId = value);
                        },
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.calendar_today),
                        label: const Text('Pick Match Date'),
                        onPressed: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime.now().subtract(const Duration(days: 365)),
                            lastDate: DateTime.now().add(const Duration(days: 365)),
                          );
                          if (picked != null) setState(() => selectedDate = picked);
                        },
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text('Create Match'),
                        onPressed: () {
                          if (selectedSquadId != null) {
                            ref.read(matchProvider.notifier).addMatch(
                                  squadId: selectedSquadId!,
                                  date: selectedDate,
                                );
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
