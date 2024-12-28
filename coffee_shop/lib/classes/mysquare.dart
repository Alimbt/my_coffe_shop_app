import 'package:flutter/material.dart';

class Mysquare extends StatefulWidget {
  final String name;
  final String imageUrl;
  // final IconData iconCoffee;
  // final IconData iconFood;
  final VoidCallback iconFavorite;
  final VoidCallback iconAdd;

  const Mysquare({
    super.key,
    required this.name,
    required this.imageUrl,
    // required this.iconCoffee,
    // required this.iconFood,
    required this.iconFavorite,
    required this.iconAdd,
  });

  @override
  State<Mysquare> createState() => _MysquareState();
}

class _MysquareState extends State<Mysquare> {
  final borderRadius = const BorderRadius.all(Radius.circular(40));
  bool isFavorite = false; // وضعیت اولیه برای قلب (خالی)

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 100,
        color: const Color.fromARGB(255, 160, 112, 94),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: borderRadius,
                child: Image.network(
                  widget.imageUrl,
                  height: 60,
                  width: 60,
                  repeat: ImageRepeat.noRepeat,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.medium,
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: child,
                    );
                  },
                ),
              ),
            ),

            Expanded(
              child: Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr,
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 8.0),
            //   child: Icon(
            //     iconFood,
            //     size: 30,
            //     color: const Color.fromARGB(255, 255, 255, 255),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite
                        ? Colors.red
                        : Colors.white, // تغییر رنگ بر اساس وضعیت
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite; // تغییر وضعیت هنگام کلیک
                    });

                    widget.iconFavorite();
                  }),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              color: Colors.white,
              onPressed: widget.iconAdd,
            ),
          ],
        ),
      ),
    );
  }
}
