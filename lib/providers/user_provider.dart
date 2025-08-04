import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? currentUSer;
  UserCredential? googleUser;

  void updateUser(UserModel newUser) {
    currentUSer = newUser;
    notifyListeners();
  }

  void updateGoogleUser(UserCredential newGoogleUser) {
    googleUser = newGoogleUser;
    notifyListeners();
  }
}
