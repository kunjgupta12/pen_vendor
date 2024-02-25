import 'package:bcrypt/bcrypt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/home/home.dart';

import 'login_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isEmailVerified = false;
  late User user;
  late String currentUId;
  late String currentEmail;
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => Loginpage());
    } else {
      Get.offAll(Home());
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      user = auth.currentUser!;

      DocumentReference collref = FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.email);
      Get.offAll(() => const Home());
      collref.set({
        'password': BCrypt.hashpw(password, BCrypt.gensalt()),
        'email': email,
        'uid': user.uid.toString(),
      });
    } catch (e) {
      Get.snackbar(
        "About user",
        "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Account creation failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => Home());
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Login  failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void Logout() async {
    await auth.signOut();
  }
}
