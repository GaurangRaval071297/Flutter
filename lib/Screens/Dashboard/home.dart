import 'package:flutter/material.dart';
import 'package:budget_app/App%20Colors/app_colors.dart';
import 'package:budget_app/Screens/Bottom%20Screen/categories_tab.dart';
import 'package:budget_app/Screens/Bottom%20Screen/home_tab.dart';
import 'package:budget_app/Screens/Bottom%20Screen/profile_tab.dart';
import 'package:budget_app/Screens/Bottom%20Screen/stats_tab.dart';
import 'package:budget_app/Screens/Bottom%20Screen/transaction_tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeTab(),
    TransactionsTab(),
    StatsTab(),
    CategoriesTab(),
    ProfileTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(icon: Icons.home, index: 0),
            _buildNavItem(icon: Icons.search, index: 1),
            _buildNavItem(icon: Icons.compare_arrows, index: 2),
            _buildNavItem(icon: Icons.layers, index: 3),
            _buildNavItem(icon: Icons.person, index: 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index}) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.bottomNavSelected.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          size: 28,
          color: isSelected ? Colors.pink : Colors.grey,
        ),
      ),
    );
  }
}
