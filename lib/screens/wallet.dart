import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../services/wallet_service.dart';
import '../services/etn_rpc_service.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final WalletService _walletService = WalletService();
  final ETNRPCService _etnRPCService = ETNRPCService();
  String? walletAddress;
  double balance = 0.0;

  @override
  void initState() {
    super.initState();
    _loadWallet();
  }

  Future<void> _loadWallet() async {
    walletAddress = await _walletService.getWalletAddress();
    if (walletAddress != null) {
      balance = await _etnRPCService.getBalance(walletAddress!);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Wallet")),
      body: Center(
        child: Column(
          children: [
            Text("Balance: $balance ETN", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            if (walletAddress != null)
              QrImageView(data: walletAddress!, size: 200),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loadWallet,
              child: Text("Refresh Balance"),
            ),
          ],
        ),
      ),
    );
  }
}
