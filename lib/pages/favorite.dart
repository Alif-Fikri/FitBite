import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  final List<Map<String, String>> favoriteItems = const [
    {
      "imageUrl": "assets/food1.png",
      "title": "Rice with meat",
      "calories": "49 Calories",
      "price": "55k"
    },
    {
      "imageUrl": "assets/food2.png",
      "title": "Rice with meat",
      "calories": "49 Calories",
      "price": "55k"
    },
    {
      "imageUrl": "assets/food3.png",
      "title": "Rice with meat",
      "calories": "49 Calories",
      "price": "55k"
    },
    {
      "imageUrl": "assets/food4.png",
      "title": "Rice with meat",
      "calories": "49 Calories",
      "price": "55k"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.shopping_cart, color: Color(0xff165F4B)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Favorite ❤️",
          style: GoogleFonts.montserrat(
              color: Color(0xff165F4B),
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xffD4DFCF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item["imageUrl"]!,
                    height: 112,
                    width: 112,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["title"]!,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Color(0xff165F4B)),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item["calories"]!,
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff6C8776),
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item["price"]!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Color(0xff165F4B)),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.green),
                  onPressed: () {
                    // Tambahkan fungsi add item
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
