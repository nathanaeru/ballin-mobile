import 'package:flutter/material.dart';
import 'package:ballin_mobile/models/product.dart';
import 'package:ballin_mobile/widgets/drawer.dart';
import 'package:intl/intl.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  final String? username;

  const ProductDetailPage({super.key, required this.product, this.username});

  String _formatPrice(int price) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 2,
    );
    return currencyFormatter.format(price);
  }

  @override
  Widget build(BuildContext context) {
    final badges = <Widget>[];

    Widget buildBadge(String label, Color color) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    if (product.isFeatured) badges.add(buildBadge('Featured', Colors.green));
    if (product.sold > 100) badges.add(buildBadge('Hot', Colors.red));
    if (product.stock <= 0)
      badges.add(buildBadge('Out of Stock', Colors.black));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.black,
      ),
      drawer: LeftDrawer(username: username),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                'https://nathanael-leander-ballin.pbp.cs.ui.ac.id/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                height: 300,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 300,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 150,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (badges.isNotEmpty) ...[
                    Wrap(spacing: 6, runSpacing: 4, children: badges),
                    const SizedBox(height: 8),
                  ],
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _formatPrice(product.price),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Seller: ${product.username}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 68, 70, 71),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Brand: ${product.brand}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 68, 70, 71),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Category: ${product.category}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 68, 70, 71),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Stock: ${product.stock}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 68, 70, 71),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Sold: ${product.sold}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 68, 70, 71),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
