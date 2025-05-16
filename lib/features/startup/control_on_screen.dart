import 'package:flutter/material.dart';
import 'package:flutterembedded/utils/button_styles.dart';
import 'package:flutterembedded/widgets/custom_alert_dialog.dart';

class ControlOnScreen extends StatelessWidget {
  const ControlOnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Help Button (top-right)
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  icon: const Icon(Icons.help_outline, color: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, '/help');
                  },
                ),
              ),

              // CREW / MANAGER / SERVICE Buttons
              ElevatedButton(
                style: ButtonStyles.primaryElevatedButtonStyle(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  context: context,
                ),
                onPressed: () => Navigator.pushNamed(context, '/preheat'),
                child: const Text(
                  'CREW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ButtonStyles.primaryElevatedButtonStyle(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  context: context,
                ),
                onPressed: () {CustomAlertDialog.show(
                        context,
                        'The manager screens are not implemented yet. Please check back later.',
                      );}, // Placeholder
                child: const Text(
                  'MANAGER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ButtonStyles.primaryElevatedButtonStyle(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  context: context,
                ),
                onPressed: () {CustomAlertDialog.show(
                        context,
                        'The service screens are not implemented yet. Please check back later.',
                      );}, // Placeholder
                child: const Text(
                  'SERVICE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Cool + Lights Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                     CustomAlertDialog.show(
                        context,
                        'The cooling feature is not implemented yet. Please check back later.',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                      maximumSize: const Size(80, 80),
                      minimumSize: const Size(64, 64),
                    ),
                    child: const Icon(
                      Icons.ac_unit,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      CustomAlertDialog.show(
                        context,
                        'The light control feature is not implemented yet. Please check back later.',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade800,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                      maximumSize: const Size(80, 80),
                      minimumSize: const Size(64, 64),
                    ),
                    child: const Icon(
                      Icons.lightbulb_outline,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Green Power Button
              IconButton(
                 onPressed: () => Navigator.pushNamed(context, '/home'),
                icon: const Icon(Icons.power_settings_new, color: Colors.green),
                iconSize: 80,
                color: Colors.green,
              ),
              const Text(
                'HEAT ON',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ButtonStyle _buttonStyle() {
  //   return ElevatedButton.styleFrom(
  //     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
  //     textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //   );
  // }
}
