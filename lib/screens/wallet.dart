import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallet"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "Your Wallet Details Here",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
