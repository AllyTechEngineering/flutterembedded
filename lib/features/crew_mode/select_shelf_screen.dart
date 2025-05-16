import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterembedded/models/shelf_data.dart';
import '../../models/product.dart';

class SelectShelfScreen extends StatefulWidget {
  const SelectShelfScreen({super.key});

  @override
  State<SelectShelfScreen> createState() => _SelectShelfScreenState();
}

class _SelectShelfScreenState extends State<SelectShelfScreen> {
  final List<ShelfData> shelves = List.generate(10, (_) => ShelfData());
  final List<Timer?> shelfTimers = List.filled(10, null);

  @override
  void dispose() {
    for (final timer in shelfTimers) {
      timer?.cancel();
    }
    super.dispose();
  }

  String _format(Duration? time) {
    if (time == null || time.inSeconds <= 0) return '00:00';
    final minutes = time.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = time.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  final List<Timer?> shelfFlashTimers = List.filled(10, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          tooltip: 'Back',
          onPressed: () => Navigator.pushNamed(context, '/control-on'),
        ),
        title: const Text('85°C',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white, size: 28),
            tooltip: 'Help',
            onPressed: () => Navigator.pushNamed(context, '/help'),
          ),
        ],
        backgroundColor: Colors.blue.shade800,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 🔷 Title Bar Above Shelf List
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color:
                shelves.any((s) => s.isExpired)
                    ? Colors.red
                    : Colors.lightBlue.shade300,
            child: Text(
              shelves.any((s) => s.isExpired) ? 'REMOVE TRAYS' : 'SELECT SHELF',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // 🔹 Shelf List Below
          Expanded(
            child: ListView.builder(
              itemCount: shelves.length,
              itemBuilder: (context, index) {
                final shelf = shelves[index];

                // ignore: unused_local_variable
                Color tileColor = Colors.blue.shade400;
                if (shelf.isExpired) {
                  tileColor = Colors.red.shade400;
                } else if (shelf.isActive) {
                  tileColor = Colors.green.shade400;
                }

                return InkWell(
                  onTap: () async {
                    if (shelf.isExpired) {
                      shelfFlashTimers[index]?.cancel();
                      setState(() {
                        shelves[index] = ShelfData();
                      });
                      return;
                    }

                    final selectedProduct = await Navigator.pushNamed(
                      context,
                      '/product-select',
                      arguments: index,
                    );

                    if (selectedProduct is Product) {
                      shelfTimers[index]?.cancel();

                      setState(() {
                        shelves[index].productName = selectedProduct.name;
                        shelves[index].remainingTime = selectedProduct.holdTime;
                        shelves[index].isActive = true;
                        shelves[index].isExpired = false;
                      });

                      shelfTimers[index] = Timer.periodic(
                        const Duration(seconds: 1),
                        (timer) {
                          setState(() {
                            final remaining = shelves[index].remainingTime!;
                            if (remaining.inSeconds <= 1) {
                              timer.cancel();
                              shelves[index].remainingTime = Duration.zero;
                              shelves[index].isActive = false;
                              shelves[index].isExpired = true;
                              shelves[index].isFlashing = true;

                              shelfFlashTimers[index] = Timer.periodic(
                                const Duration(milliseconds: 500),
                                (_) {
                                  setState(() {
                                    shelves[index].isFlashing =
                                        !shelves[index].isFlashing;
                                  });
                                },
                              );
                            } else {
                              shelves[index].remainingTime = Duration(
                                seconds: remaining.inSeconds - 1,
                              );
                            }
                          });
                        },
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                      color:
                          shelf.isExpired
                              ? (shelf.isFlashing
                                  ? Colors.red.shade400
                                  : Colors.red.shade200)
                              : (shelf.isActive
                                  ? Colors.green.shade400
                                  : Colors.blue.shade400),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AnimatedOpacity(
                            opacity:
                                shelf.isExpired && shelf.isFlashing ? 0.2 : 1.0,
                            duration: const Duration(milliseconds: 300),
                            child: Text(
                              shelf.productName != null
                                  ? '${index + 1}.  ${shelf.productName}  ${_format(shelf.remainingTime)}'
                                  : '${index + 1}.  --:--',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        if (shelf.isActive)
                          IconButton(
                            icon: const Icon(Icons.cancel, color: Colors.white),
                            tooltip: 'Cancel Timer',
                            onPressed: () {
                              setState(() {
                                shelfTimers[index]?.cancel();
                                shelves[index] =
                                    ShelfData(); // reset shelf state
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
