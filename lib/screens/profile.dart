import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  void _logout(BuildContext context) async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/');
  }

  void _goToWallet(BuildContext context) {
    Navigator.pushNamed(context, '/wallet'); // Wallet Navigation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'wallet') {
                _goToWallet(context);
              } else if (value == 'logout') {
                _logout(context);
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'wallet',
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet, color: Colors.blue),
                    SizedBox(width: 10),
                    Text("Go to Wallet"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 10),
                    Text("Logout"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(
                user?.photoURL ?? "https://via.placeholder.com/150",
              ),
            ),
            SizedBox(height: 10),

            // Username
            Text(
              user?.displayName ?? "Guest User",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            // Bio
            Text(
              "NFT Farmer | Decentralized Social Media User",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),

            // Wallet Balance & Coins
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Coins", style: TextStyle(color: Colors.grey)),
                    Text("1024 ETN", style: TextStyle(fontSize: 18)),
                  ],
                ),
                Column(
                  children: [
                    Text("NFT Plots", style: TextStyle(color: Colors.grey)),
                    Text("4 Plots", style: TextStyle(fontSize: 18)),
                  ],
                ),
                Column(
                  children: [
                    Text("Badges", style: TextStyle(color: Colors.grey)),
                    Text("12 Badges", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Edit Profile Button
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.edit),
              label: Text("Edit Profile"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[200],
                    child: Icon(Icons.image, size: 50),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
