import 'package:flutter/material.dart';

class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: CircleAvatar(
          radius: 20, // Increased radius for better alignment
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, color: Colors.white, size: 24),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/profile'); // Navigate to Profile Page
        },
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10), // Top and Bottom Padding
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Text color for better visibility
          ),
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 2, // Subtle shadow effect
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70); // App Bar Height
}
