import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/get_all_products.dart';

class CustomExpanded extends StatefulWidget {
  final String searchQuery;
  final int selectedCategoryIndex;
  final Function(ProductModel) toggleFavorite;

  const CustomExpanded({
    Key? key,
    required this.searchQuery,
    required this.selectedCategoryIndex,
    required this.toggleFavorite,
  }) : super(key: key);

  @override
  State<CustomExpanded> createState() => _CustomExpandedState();
}

class _CustomExpandedState extends State<CustomExpanded> {
  final List<String> categories = [
    "All",
    "men's clothing",
    "women's clothing",
    "jewelry",
    "electronics",
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<ProductModel>>(
        future: GetAllProducts().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;

            // Filter products by category and search query (case-insensitive)
            if (widget.selectedCategoryIndex != 0) {
              String selectedCategory = categories[widget.selectedCategoryIndex].toLowerCase();
              products = products.where((product) => product.category.toLowerCase() == selectedCategory).toList();
            }
            if (widget.searchQuery.isNotEmpty) {
              products = products.where((product) =>
                  product.title.toLowerCase().contains(widget.searchQuery.toLowerCase())
              ).toList();
            }

            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Stack(
                  children: [
                    Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                              padding: const EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                child: Image.network(
                                  product.image,
                                  fit: BoxFit.contain,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      product.title.substring(0, 8),
                                      style: const TextStyle(
                                        color: Color(0xFF3E2723),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    const Text(
                                      '4.5',
                                      style: TextStyle(
                                        color: Color(0xFF3E2723),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '\$${product.price}',
                                  style: const TextStyle(
                                    color: Color(0xFF3E2723),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 9,
                      right: 5,
                      child: IconButton(
                        icon: Icon(
                          product.isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.brown,
                        ),
                        onPressed: () {
                          widget.toggleFavorite(product);
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
