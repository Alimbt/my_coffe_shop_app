import 'package:coffee_shop/api/cart_api.dart';
import 'package:coffee_shop/classes/bottom_navigation.dart';
import 'package:coffee_shop/classes/mysquare.dart';
import 'package:coffee_shop/user_pages/favorite_page.dart';
import 'package:coffee_shop/user_pages/food_page.dart';
import 'package:coffee_shop/user_pages/drink_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartApi cartApi = CartApi();
  List<dynamic> cartItems = [];

  @override
  void initState() {
    super.initState();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    try {
      final items = await cartApi.getAllCart();
      setState(() {
        cartItems = items;
      });
    } catch (e) {
      print('Failed to load cart items: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 71, 71),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          'your basket',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return Mysquare(
            imageUrl: cartItem['image_url'],
            name: cartItem['name'],
            iconFavorite: () {},
            iconAdd: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 1),
                content: Text('${cartItem['name']} added to your cart'),
              ));
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(
        onIconPressed: (index) {
          switch (index) {
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DrinkPage()));
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoritePage()));
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
