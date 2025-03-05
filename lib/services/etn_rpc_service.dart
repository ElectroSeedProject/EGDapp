import 'dart:convert';
import 'package:http/http.dart' as http;

class ETNRPCService {
  final String rpcUrl = "https://rpc.ankr.com/electroneum_testnet/41dd76ba0e803fbe30deef3edaca6e6d4a5070a8475abc32b1ff26b1f87df2dc";

  Future<double> getBalance(String address) async {
    final response = await http.post(
      Uri.parse(rpcUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "jsonrpc": "2.0",
        "method": "get_balance",
        "params": {"address": address},
      }),
    );

    final result = jsonDecode(response.body);
    return result["result"]["balance"] / 1e2; // Convert atomic ETN to ETN
  }

  Future<String> sendETN(String fromAddress, String toAddress, double amount, String privateKey) async {
    final response = await http.post(
      Uri.parse(rpcUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "jsonrpc": "2.0",
        "method": "transfer",
        "params": {
          "from_address": fromAddress,
          "to_address": toAddress,
          "amount": (amount * 1e2).toInt(),
          "private_key": privateKey
        }
      }),
    );

    final result = jsonDecode(response.body);
    return result["result"]["tx_hash"];
  }
}
