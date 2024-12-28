import 'package:coffee_shop/api/cart_api.dart';
import 'package:coffee_shop/api/foods_api.dart';
import 'package:coffee_shop/classes/bottom_navigation.dart';
import 'package:coffee_shop/classes/favorites_manager.dart';
import 'package:coffee_shop/classes/mysquare.dart';
import 'package:coffee_shop/user_pages/cart_page.dart';
import 'package:coffee_shop/user_pages/favorite_page.dart';
import 'package:coffee_shop/user_pages/drink_page.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final CartApi cartApi = CartApi();
  List<dynamic> foods = [];

  @override
  void initState() {
    super.initState();
    fetchFoods();
  }

  Future<void> fetchFoods() async {
    try {
      final foodsApi = FoodsApi();
      final fetchedFoods = await foodsApi.getAllFoods();
      setState(() {
        foods = fetchedFoods;
      });
    } catch (e) {
      print('Failed to load foods: $e');
    }
  }

  Future<void> addToCart(String name, String imageUrl) async {
    try {
      await cartApi.addCart({'name': name, 'image_url': imageUrl});
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$name added to cart'),
        duration: const Duration(seconds: 1),
      ));
    } catch (e) {
      print('Failed to add to cart: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 71, 71),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          'foods menu',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];
          return Mysquare(
            imageUrl: food['image_url'],
            name: food['name'],
            iconFavorite: () {
              FavoritesManager.addFavoriteFood(food['name']);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${food['name']} added to favorites'),
                duration: const Duration(seconds: 1),
              ));
            },
            iconAdd: () {
              addToCart(food['name'], food['image_url']);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${food['name']} added to Cart'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(
        onIconPressed: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritePage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DrinkPage()),
              );
              break;
          }
        },
      ),
    );
  }
}
