import 'package:flutter/material.dart';

enum ShelfState { ready, active, expired }

class ShelfTile extends StatelessWidget {
  final int shelfNumber;
  final ShelfState state;
  final VoidCallback onTap;
  final String? timerText;

  const ShelfTile({
    super.key,
    required this.shelfNumber,
    required this.state,
    required this.onTap,
    this.timerText,
  });

  Color _getTileColor() {
    switch (state) {
      case ShelfState.ready:
        return Colors.blue.shade300;
      case ShelfState.active:
        return Colors.green.shade400;
      case ShelfState.expired:
        return Colors.red.shade400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        color: _getTileColor(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Shelf $shelfNumber',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              if (timerText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    timerText!,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
