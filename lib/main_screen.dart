import 'package:flutter/material.dart';
import 'package:furniture_yt/views/categories/categories_page.dart';
import 'package:furniture_yt/views/home/home_page.dart';
import 'package:furniture_yt/views/profile/profile_page.dart';
import 'package:furniture_yt/views/saved/saved_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> pageList = [
    HomePage(),
    CategoriesPage(),
    SavedPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
       
        onTap: (value) {
          setState(() {
                     _currentIndex = value;
 
          });
        },
        items: [
          BottomNavigationBarItem(
            
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
