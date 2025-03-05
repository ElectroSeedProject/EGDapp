import 'package:flutter/material.dart';
import '../widgets/common_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(title: 'Home'), // Common Header
      body: Center(
        child: Text("This is Home Page"),
      ),
    );
  }
}
