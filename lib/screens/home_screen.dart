import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_apps/models/product_model.dart';
import 'package:store_apps/screens/profile_screen.dart';
import 'package:store_apps/screens/setting_screen.dart';
import 'package:store_apps/services/get_all_products.dart';
import 'package:store_apps/widgets/Custombutton.dart';
import 'package:store_apps/widgets/custom_bottomNavigationBar.dart';
import 'package:store_apps/widgets/custom_expanded.dart';
import 'favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryIndex = 0;
  int _selectedBottomNavIndex = 0; // Start on home icon

  final List<String> categories = [
    "All",
    "men's clothing",
    "women's clothing",
    "jewelry",
    "electronics",
  ];

  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // List to store favorite products
  List<ProductModel> favoriteProducts = [];

  void toggleFavorite(ProductModel product) {
    setState(() {
      product.isFavorite = !product.isFavorite;
      if (product.isFavorite) {
        favoriteProducts.add(product);
        _selectedBottomNavIndex = 0;
      } else {
        favoriteProducts.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget getBody() {
      switch (_selectedBottomNavIndex) {
        case 0:
          return _buildHomeBody();
        case 1:
          return FavoritesScreen(
            favoriteProducts: favoriteProducts,
            toggleFavorite: toggleFavorite,
          );
        case 2:
          return ProfileScreen(); // Navigate to Profile Screen
        case 3:
          return SettingsScreen(); // Navigate to Settings Screen
        default:
          return _buildHomeBody();
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Wishlist',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
        ),
        centerTitle: true,
      ),
      body: getBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: CustomBottom(),
        ),
      ),
    );
  }
  Widget _buildHomeBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search for a category...',
              hintStyle: const TextStyle(fontSize: 14),
              prefixIcon: const Icon(Icons.search, size: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            ),
            style:const  TextStyle(fontSize: 14),
            onChanged: (value) {
              setState(() {
                searchQuery = value.toLowerCase();
              });
            },
          ),
        ),
        Container(
          height: 55,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) =>
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == index
                            ? Colors.brown
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: selectedCategoryIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          ),
        ),
        // Products Grid
        CustomExpanded(
          searchQuery: searchQuery,
          selectedCategoryIndex: selectedCategoryIndex,
          toggleFavorite: toggleFavorite,
        ),
      ],
    );
  }
}

