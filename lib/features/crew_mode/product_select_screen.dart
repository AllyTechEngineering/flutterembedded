import 'package:flutter/material.dart'; // adjust if needed
import 'dummy_products.dart';
import 'product_tile.dart';

class ProductSelectScreen extends StatelessWidget {
  const ProductSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Get the shelf index from arguments
    final shelfIndex = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        centerTitle: true,
        title: Text(
          'Select Product for Shelf ${shelfIndex + 1}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          tooltip: 'Back',
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white, size: 28),
            tooltip: 'Home',
            onPressed: () => Navigator.pushNamed(context, '/home'),
          ),
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white, size: 28),
            tooltip: 'Help',
            onPressed: () => Navigator.pushNamed(context, '/help'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          final product = dummyProducts[index];
          return ProductTile(
            product: product,
            onTap: () {
              // ✅ Return the selected product to the previous screen
              Navigator.pop(context, product);
            },
          );
        },
      ),
    );
  }
}
