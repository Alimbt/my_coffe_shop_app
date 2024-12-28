import 'package:coffee_shop/api/cart_api.dart';
import 'package:coffee_shop/api/drinks_api.dart';
import 'package:coffee_shop/classes/bottom_navigation.dart';

import 'package:coffee_shop/classes/favorites_manager.dart';
import 'package:coffee_shop/classes/mysquare.dart';

import 'package:coffee_shop/user_pages/cart_page.dart';
import 'package:coffee_shop/user_pages/favorite_page.dart';
import 'package:coffee_shop/user_pages/food_page.dart';
import 'package:flutter/material.dart';

// import 'package:coffe_shop/dbcontext.dart';
class DrinkPage extends StatefulWidget {
  const DrinkPage({super.key});

  @override
  State<DrinkPage> createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {
  final DrinksApi drinksApi = DrinksApi();
  List<dynamic> drinks = [];

  @override
  void initState() {
    super.initState();
    fetchDrinks();
  }

  Future<void> fetchDrinks() async {
    try {
      final fetchedDrinks = await drinksApi.getAllDrinks();
      setState(() {
        drinks = fetchedDrinks;
      });
    } catch (e) {
      print('Failed to load drinks: $e');
    }
  }

  Future<void> addToCart(String name, String imageUrl) async {
    try {
      final cartApi = CartApi();
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
          'Coffee Shop Menu',
          style: TextStyle(color: Colors.white),
        ),
      ),
      //list view
      body: ListView.builder(
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          final drink = drinks[index];
          return Mysquare(
            imageUrl: drink['image_url'], // استفاده از لیست تصاویر
            name: drink['name'], // استفاده از لیست نام ها

            iconFavorite: () {
              FavoritesManager.addFavoriteCoffee(drink['name']);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${drink['name']} added to favorites'),
                duration: const Duration(seconds: 1),
              ));
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.coffee,
                  size: 30,
                  color: Color.fromARGB(255, 219, 200, 22),
                ),
              );
            },

            iconAdd: () {
              addToCart(drink['name'], drink['image_url']);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${drink['name']} added to Cart'),
                duration: const Duration(seconds: 1),
              ));
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(
        onIconPressed: (index) {
          // اجرای دستور مربوط به هر دکمه
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
                  MaterialPageRoute(
                      builder: (context) => const FavoritePage()));
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FoodPage()),
              );
              break;
          }
        },
      ),
    );
  }
}
