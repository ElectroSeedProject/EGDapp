import 'package:local_auth/local_auth.dart';

class AuthService {
  final _auth = LocalAuthentication();

  Future<bool> authenticate() async {
    bool isAuthenticated = await _auth.authenticate(
      localizedReason: 'Authenticate to access wallet',
      options: const AuthenticationOptions(biometricOnly: true),
    );
    return isAuthenticated;
  }
}
