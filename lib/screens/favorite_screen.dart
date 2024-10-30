import 'package:flutter/material.dart';

import '../models/product_model.dart';

class FavoritesScreen extends StatelessWidget {
  final List<ProductModel> favoriteProducts;
  final Function toggleFavorite;

  const FavoritesScreen({
    Key? key,
    required this.favoriteProducts,
    required this.toggleFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favoriteProducts.isEmpty
        ? const Center(child: Text('No favorite products yet!'))
        : GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: favoriteProducts.length,
      itemBuilder: (context, index) {
        final product = favoriteProducts[index];
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
                      decoration:const  BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius:const  BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
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
                  product.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.brown,
                ),
                onPressed: () {
                  toggleFavorite(product);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}