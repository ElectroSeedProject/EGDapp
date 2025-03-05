import 'package:flutter/material.dart';

import 'home.dart';
import 'post.dart';
import 'market.dart';
import 'reels.dart';
import 'add_post.dart'; // New Add Post Page

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    PostPage(),
    AddPostPage(), // Replacing ProfilePage with AddPostPage
    MarketPage(),
    ReelsPage(),
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
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: "Post"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: "Add Post"), // New Add Post Icon
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Market"),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: "Reels"),
        ],
      ),
    );
  }
}
