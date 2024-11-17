import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> cartItems = [
    {
      "image": "assets/food1.png",
      "name": "Rice with meat",
      "calories": "49 Calories",
      "price": 55000,
      "quantity": 1
    },
    {
      "image": "assets/food2.png",
      "name": "Rice with meat",
      "calories": "49 Calories",
      "price": 55000,
      "quantity": 1
    },
    {
      "image": "assets/food3.png",
      "name": "Rice with meat",
      "calories": "49 Calories",
      "price": 55000,
      "quantity": 1
    },
    {
      "image": "assets/food4.png",
      "name": "Rice with meat",
      "calories": "49 Calories",
      "price": 55000,
      "quantity": 1
    },
  ];

  int calculateSubtotal() {
    return cartItems.fold(
        0, (sum, item) => sum + (item["price"] * item["quantity"] as int));
  }

  void updateQuantity(int index, bool isIncrement) {
    setState(() {
      if (isIncrement) {
        cartItems[index]["quantity"]++;
      } else if (cartItems[index]["quantity"] > 1) {
        cartItems[index]["quantity"]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.shopping_cart, color: Color(0xff165F4B)),
            SizedBox(width: 8),
            Text(
              "My Cart",
              style: GoogleFonts.montserrat(
                  color: Color(0xff165F4B), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        item["image"],
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["name"],
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff165F4B)),
                            ),
                            SizedBox(height: 4),
                            Text(
                              item["calories"],
                              style: GoogleFonts.montserrat(color: Colors.grey),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "${item["price"] ~/ 1000}k",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Color(0xff165F4B)),
                            onPressed: () => updateQuantity(index, false),
                          ),
                          Text(
                            "${item["quantity"]}",
                            style: GoogleFonts.montserrat(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, color: Color(0xff165F4B)),
                            onPressed: () => updateQuantity(index, true),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 32.0,
                  width: 349.0,
                  decoration: BoxDecoration(
                      color: Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Subtotal",
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Color(0xff165F4B),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${calculateSubtotal() ~/ 1000}k",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 69.0,
                  width: 322.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff165F4B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      // Tambahkan fungsi checkout di sini
                    },
                    child: Text(
                      "Checkout",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
