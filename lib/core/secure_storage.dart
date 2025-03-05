import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> savePrivateKey(String key) async {
    await _storage.write(key: 'privateKey', value: key);
  }

  Future<String?> getPrivateKey() async {
    return await _storage.read(key: 'privateKey');
  }
}
