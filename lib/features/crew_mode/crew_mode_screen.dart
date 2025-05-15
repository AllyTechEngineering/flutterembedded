import 'package:flutter/material.dart';
import 'package:flutterembedded/features/crew_mode/shelf_tile.dart';

class CrewModeScreen extends StatelessWidget {
  const CrewModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crew Mode'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              // TODO: Add Help dialog
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // adjust as needed
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.3,
              ),
              itemCount: 8, // number of shelves
              itemBuilder: (context, index) {
                return ShelfTile(
                  shelfNumber: index + 1,
                  state: ShelfState.ready,
                  timerText: null, // or "02:00", "00:00" etc.
                  onTap: () {
                    // TODO: Navigate to product selection or activate shelf
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.lightbulb),
                  label: const Text('Lights'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.ac_unit),
                  label: const Text('Cool Down'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Exit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
