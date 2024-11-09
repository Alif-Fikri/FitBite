import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6F8D6A), // Background color
      body: SafeArea(
        child: Column(
          children: [
            // Top section with custom background shape
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.green),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Text(
                    "12.04",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset(
                        'assets/meal.jpg', // Replace with your image asset
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Food description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Rice with meat",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                    "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNutritionInfo("101 g", "Carbs"),
                      _buildNutritionInfo("10 g", "Proteins"),
                      _buildNutritionInfo("12 g", "Fats"),
                      _buildNutritionInfo("15 g", "Sugars"),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "49 Calories",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24),
                  // Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Colors.green[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        // Button action
                      },
                      child: Text(
                        "Tambahkan ke Keranjang",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionInfo(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
