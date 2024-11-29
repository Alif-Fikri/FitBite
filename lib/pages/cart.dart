import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:fitbite/helper/cartprovider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

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
          // List of Cart Items
          Expanded(
              child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image
                    Image.network(
                      item.image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16),
                    // Item Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff165F4B)),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "${item.price * item.quantity}k", // Format harga
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "${item.calories * item.quantity} calories", // Tampilkan kalori
                            style: GoogleFonts.montserrat(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    // Quantity Controls
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove, color: Color(0xff165F4B)),
                          onPressed: () =>
                              cartProvider.updateQuantity(item, false),
                        ),
                        Text(
                          "${item.quantity}",
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.add, color: Color(0xff165F4B)),
                          onPressed: () =>
                              cartProvider.updateQuantity(item, true),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Subtotal Container
                Container(
                  height: 32.0,
                  width: 349.0,
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                        "${cartProvider.calculateSubtotal()}k",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                // Total Calories Container
                Container(
                  height: 32.0,
                  width: 349.0,
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Total Calories",
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Color(0xff165F4B),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${cartProvider.calculateTotalCalories()} cal",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // Checkout Button
                SizedBox(
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
