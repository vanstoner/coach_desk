import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/match.dart';
import '../domain/models/squad.dart';
import '../state/match_provider.dart';
import '../state/squad_provider.dart';
import '../utils/date_helpers.dart';

class MatchDetailScreen extends ConsumerWidget {
  final String matchID;

  const MatchDetailScreen({super.key, required this.matchID});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final match = ref.watch(matchProvider).firstWhere((m) => m.id == matchID);
    final squad = ref.watch(squadProvider).firstWhere(
          (s) => s.id == match.squadId,
          orElse: () => const Squad(id: '', name: 'Unknown', playerIds: [], captainId: ''),
        );

    final matchNotifier = ref.read(matchProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Match Details')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Opacity(
            opacity: 0.15,
            child: Image.asset(
              'assets/images/blank.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),

          // Foreground content
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Squad: ${squad.name}', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Kickoff: ${formatMatchDate(match.date)}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.access_time),
                      label: const Text('Change'),
                      onPressed: () async {
                        final picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(match.date),
                        );
                        if (picked != null) {
                          final updatedDate = DateTime(
                            match.date.year,
                            match.date.month,
                            match.date.day,
                            picked.hour,
                            picked.minute,
                          );
                          final updatedMatch = match.copyWith(date: updatedDate);
                          matchNotifier.updateMatch(updatedMatch);
                        }
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Quarters and Duration on same row
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Quarters:', style: TextStyle(fontWeight: FontWeight.bold)),
                          DropdownButton<int>(
                            value: match.quarterCount,
                            isExpanded: true,
                            items: [2, 3, 4]
                                .map((q) => DropdownMenuItem(value: q, child: Text('$q')))
                                .toList(),
                            onChanged: (newCount) {
                              if (newCount != null) {
                                ref.read(matchProvider.notifier).updateMatch(
                                      match.copyWith(quarterCount: newCount),
                                    );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Minutes per Quarter:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          DropdownButton<int>(
                            value: match.quarterDuration,
                            isExpanded: true,
                            items: [10, 15, 20]
                                .map((q) => DropdownMenuItem(value: q, child: Text('$q mins')))
                                .toList(),
                            onChanged: (newDuration) {
                              if (newDuration != null) {
                                ref.read(matchProvider.notifier).updateMatch(
                                      match.copyWith(quarterDuration: newDuration),
                                    );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                const Text('Match Status:'),
                DropdownButton<MatchStatus>(
                  value: match.status,
                  isExpanded: true,
                  items: MatchStatus.values.map((status) {
                    return DropdownMenuItem(
                      value: status,
                      child: Text(status.name),
                    );
                  }).toList(),
                  onChanged: (newStatus) {
                    if (newStatus != null) {
                      final updated = match.copyWith(status: newStatus);
                      matchNotifier.updateMatch(updated);
                    }
                  },
                ),

                const SizedBox(height: 24),

                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.description),
                    label: const Text('Prepare Team Sheet'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Team sheet generation coming soon')),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
