import 'package:evently_app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? currentUSer;

  void updateUser(UserModel newUser) {
    currentUSer = newUser;
    notifyListeners();
  }
}
