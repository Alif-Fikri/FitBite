import 'package:fitbite/pages/cart.dart';
import 'package:fitbite/pages/home.dart';
import 'package:fitbite/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitbite/helper/cartprovider.dart';
import 'package:fitbite/helper/cartitem.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class MenuNav extends StatefulWidget {
  @override
  _MenuNavState createState() => _MenuNavState();
}

class _MenuNavState extends State<MenuNav> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    HomePages(),
    InboxScreen(),
    CartPage(),
    FavoriteScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFF6C8776), // Warna saat aktif
        unselectedItemColor: Colors.grey, // Warna saat tidak aktif
        selectedLabelStyle:
            GoogleFonts.montserrat(fontSize: 13, fontWeight: FontWeight.w600),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return badges.Badge(
                  badgeContent: Text(
                    '${cartProvider.totalItems}', // Total item di keranjang
                    style: TextStyle(color: Colors.white),
                  ),
                  badgeStyle: badges.BadgeStyle(badgeColor: Colors.red),
                  child: Icon(Icons.shopping_cart),
                );
              },
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

// Halaman Inbox
class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Inbox Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Halaman Favorite
class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorite Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
