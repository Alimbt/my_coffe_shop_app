import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int) onIconPressed;

  const BottomNavigation({Key? key, required this.onIconPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown, // رنگ پس‌زمینه نوار پایین
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
            onPressed: () => onIconPressed(0), // فراخوانی تابع مربوط به دکمه
          ),
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () => onIconPressed(1),
          ),
          IconButton(
            icon: const Icon(Icons.local_pizza_rounded, color: Colors.white),
            onPressed: () => onIconPressed(2),
          ),
          IconButton(
            icon: const Icon(Icons.emoji_food_beverage, color: Colors.white),
            onPressed: () => onIconPressed(3),
          ),
        ],
      ),
    );
  }
}
