import 'package:flutter/material.dart';
import 'package:provider_pt1/cart.dart';
import 'package:provider_pt1/search.dart';
import 'package:provider_pt1/shoppage.dart';

class BottomNavigation extends StatefulWidget {
  final int? indicator;
  const BottomNavigation({super.key, required this.indicator});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  late List<Widget> widgetList;

  @override
  void initState() {
    super.initState();
    widgetList = [ShopPage(indicator: widget.indicator), SearchPage(), Cart()];
  }

  void onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset('assets/logo/logo.png', height: 90),
      ),
      body: Center(child: widgetList[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onNavTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
