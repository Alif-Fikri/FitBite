import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitbite/helper/menuitem.dart';
import 'package:provider/provider.dart';
import 'package:fitbite/helper/cartprovider.dart';
import 'package:fitbite/helper/cartitem.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchText = '';
  List<MenuItem> cartItems = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _onItemTapped(int index) {
    setState(() {});
  }

  void _addToCart(MenuItem item) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addToCart(CartItem(
      name: item.name,
      price: item.price,
      image: item.imageUrl,
      quantity: 1,
      calories: int.parse(item.calories),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text('FitBite',
                      style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  SizedBox(height: 5),
                  Text('Untuk pertama kalinya di sini?',
                      style: GoogleFonts.montserrat(
                          fontSize: 15.0, color: Colors.black)),
                  SizedBox(height: 20),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Cari di aplikasi FitBite',
                      hintStyle: GoogleFonts.montserrat(),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      fillColor: Color(0xFFD9D9D9),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ButtonsTabBar(
                    controller: _tabController,
                    backgroundColor: Color(0xFF6C8776),
                    unselectedBackgroundColor: Color(0xFFD4DFCF),
                    labelStyle: GoogleFonts.montserrat(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    unselectedLabelStyle: GoogleFonts.montserrat(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    radius: 50,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    tabs: [
                      Tab(text: 'Hot Sale'),
                      Tab(text: 'Popularity'),
                      Tab(text: 'New Menu'),
                      Tab(text: 'All Menu'),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            // Food Grid Section
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  FoodGrid(
                    menuItems: HotSaleMenu.getFilteredItems(_searchText),
                    onAddToCart: _addToCart,
                  ),
                  FoodGrid(
                    menuItems: PopularMenu.getFilteredItems(_searchText),
                    onAddToCart: _addToCart,
                  ),
                  FoodGrid(
                    menuItems: NewMenu.getFilteredItems(_searchText),
                    onAddToCart: _addToCart,
                  ),
                  FoodGrid(
                    menuItems: AllMenu.getFilteredItems(_searchText),
                    onAddToCart: _addToCart,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Food Grid Widget
class FoodGrid extends StatelessWidget {
  final List<MenuItem> menuItems;
  final Function(MenuItem) onAddToCart;

  FoodGrid({required this.menuItems, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return FoodItemCard(
          menuItem: menuItems[index],
          onAddToCart: onAddToCart, // Mengoper fungsi ke FoodItemCard
        );
      },
    );
  }
}

// Food Item Card Widget
class FoodItemCard extends StatelessWidget {
  final MenuItem menuItem;
  final Function(MenuItem)
      onAddToCart; // Fungsi untuk menangani penambahan ke cart

  FoodItemCard({required this.menuItem, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 160,
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(menuItem.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(menuItem.name,
                    style: GoogleFonts.montserrat(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                Text('${menuItem.price}k',
                    style: GoogleFonts.montserrat(
                        fontSize: 13.0, color: Colors.black)),
                SizedBox(height: 4),
                Text('Details',
                    style: GoogleFonts.montserrat(
                        fontSize: 10.0,
                        color: Color(0xFF6C8776),
                        decoration: TextDecoration.underline)),
              ],
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    // Tambahkan aksi di sini
                    onAddToCart(menuItem);
                  },
                  child: Image.asset(
                    'assets/chart.png',
                    height: 23,
                    width: 24,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
