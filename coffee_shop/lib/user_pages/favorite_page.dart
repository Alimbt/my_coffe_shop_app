import 'package:coffee_shop/api/favorite_api.dart';
import 'package:coffee_shop/classes/bottom_navigation.dart';
import 'package:coffee_shop/classes/mysquare.dart';
import 'package:coffee_shop/user_pages/cart_page.dart';
import 'package:coffee_shop/user_pages/food_page.dart';
import 'package:coffee_shop/user_pages/drink_page.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoriteApi _favoriteApi = FavoriteApi();
  List<dynamic> favoriteItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFavorites();
  }

  Future<void> fetchFavorites() async {
    setState(() {
      isLoading = true;
    });
    try {
      final items = await _favoriteApi.getAllFavorites('1');
      setState(() {
        favoriteItems = items;
        isLoading = false;
      });
    } catch (e) {
      const RiveAnimation.asset('assets/animations/cup_walk.riv');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 71, 71),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          'favorite lists',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: isLoading
          ? const Center(
              child: RiveAnimation.asset('assets/animations/cup_walk.riv'))
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final favorite = favoriteItems[index];
                String favoriteItem = favorite['name'];
                int coffeeIndex = favorite(favoriteItem);
                int foodIndex = favorite(favoriteItem);

                String imageUrl;
                if (coffeeIndex != -1) {
                  // اگر آیتم از لیست قهوه‌ها باشد
                  imageUrl = favorite[coffeeIndex];
                } else if (foodIndex != -1) {
                  // اگر آیتم از لیست غذاها باشد
                  imageUrl = favorite[foodIndex];
                } else {
                  imageUrl = 'https://via.placeholder.com/150';
                }

                return Mysquare(
                  imageUrl: imageUrl,
                  name: favoriteItem,
                  iconFavorite: () {},
                  iconAdd: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: const Duration(seconds: 1),
                      content:
                          Text('$favoriteItem added to your favorite cart'),
                    ));
                  },
                );
              },
            ),
      bottomNavigationBar: BottomNavigation(
        onIconPressed: (index) {
          switch (index) {
            //cart page
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
              break;
            //home page
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DrinkPage()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FoodPage()));
              break;
          }
        },
      ),
    );
  }
}
