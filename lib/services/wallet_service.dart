import 'package:web3dart/web3dart.dart';

class WalletService {
  Future<Wallet> generateWallet() async {
    final ethPrivateKey = EthPrivateKey.createRandom();
    final address = await ethPrivateKey.extractAddress();
    return Wallet(address: address.hex, privateKey: ethPrivateKey.privateKeyInt.toString());
  }
}
