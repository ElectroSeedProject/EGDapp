import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/post.dart';
import 'screens/market.dart';
import 'screens/profile.dart';
import 'screens/reels.dart';
import 'screens/nav.dart';
import 'screens/wallet.dart';

class AppRoutes {
  static const String nav = '/';
  static const String home = '/home';
  static const String post = '/post';
  static const String market = '/market';
  static const String profile = '/profile';
  static const String reels = '/reels';
  static const String wallet = '/wallet';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case nav:
        return MaterialPageRoute(builder: (_) => BottomNavBar());
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case post:
        return MaterialPageRoute(builder: (_) => PostPage());
      case market:
        return MaterialPageRoute(builder: (_) => MarketPage());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case reels:
        return MaterialPageRoute(builder: (_) => ReelsPage());
      case wallet:
        return MaterialPageRoute(builder: (_) => WalletScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('Page Not Found')),
                ));
    }
  }
}
