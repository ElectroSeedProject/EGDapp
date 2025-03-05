import 'dart:convert';
import 'package:http/http.dart' as http;

class ETNService {
  final String rpcUrl = "https://rpc.ankr.com/electroneum_testnet/41dd76ba0e803fbe30deef3edaca6e6d4a5070a8475abc32b1ff26b1f87df2dc/";

  Future<double> getBalance(String address) async {
    final response = await http.post(
      Uri.parse(rpcUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "jsonrpc": "2.0",
        "id": "0",
        "method": "get_balance",
        "params": {"address": address}
      }),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result["result"]["balance"] / 1e2; // ETN has 2 decimal places
    } else {
      throw Exception("Failed to fetch balance");
    }
  }
}
