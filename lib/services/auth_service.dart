import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/services/util_service.dart';

final class AuthService {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<User?> registerUser(
    BuildContext context, {
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(fullName);
        await userCredential.user!.reload();
        User? updatedUser = FirebaseAuth.instance.currentUser;
        return updatedUser;
      } else {
        return null;
      }
    } catch (e) {
      Utils.fireSnackBar(context,'$e');
      return null;
    }
  }

  static Future<User?> loginUser(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return userCredential.user;
      } else {
        return null;
      }
    } catch (e) {
      Utils.fireSnackBar(context,'$e');
      return null;
    }
  }

  static Future<void> deleteAccount()async{
    await auth.currentUser?.delete();
  }

  static Future<void> logOut()async{
    await auth.signOut();
  }
}
