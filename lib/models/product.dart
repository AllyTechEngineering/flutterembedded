class Product {
  final String name;
  final String imageAsset;
  final String category;

  const Product({
    required this.name,
    required this.imageAsset,
    this.category = '',
  });
}
