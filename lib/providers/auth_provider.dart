import 'package:flutter/cupertino.dart';
import 'package:shamo/models/user_models.dart';
import 'package:shamo/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  // ADD GETTER AND SETTER
  UserModel get user => _user;

  // SETTER
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  // FUNCTION FOR REGISTER
  Future<bool> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    // TRY CATCH FOR REGISTER SUCCES OR NOT
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      // IF SUCCESS
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
