import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';
import '../controller/signinController.dart';
import '../controller/signupController.dart';
import '../main.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore store = FirebaseFirestore.instance;
final signupcontroller = Get.put(signUpController());
final signincontroller = Get.put(signinController());
UserCredential? userCredentials;
User? user;

// var user;

Future Signup(
    {required String email,
    required String name,
    required String password,
    required String confirmPassword,
    required String businessName,
    required String businessCategory,
    required String businessLocation,
    required String CNIC,
    required String phone}) async {
  signupcontroller.successfullSignup.value = true;
  try {
    userCredentials = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredentials?.user;

    if (user != null) {
      user?.updateDisplayName(name);
      user?.updateEmail(email);

      await user?.reload();
    }
    // await store.collection('User').doc(businessCategory).set({
    //   'userName': ' ',
    // });
    await FirebaseFirestore.instance
        .collection('User')
        .doc(auth.currentUser?.uid)
        .set({
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'Business Name': businessName,
      'Business Category': businessCategory,
      'Business Location': businessLocation,
      'CNIC': CNIC,
      'Phone': phone,
      'userId': auth.currentUser!.uid,
    });
    Get.toNamed('/drawer');
    signupcontroller.successfullSignup.value = false;
  } on FirebaseException catch (e) {
    switch (e.code) {
      case "email-already-in-use":
        signupcontroller.NewUser.value = false;
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Email Already Exists',
            message: 'The email you entered is currently in use. Try Again.',
            backgroundColor: AppColors.pink,
            duration: Duration(seconds: 4),
            icon: Icon(Icons.incomplete_circle_rounded),
          ),
        );
        break;
    }

    print(e);
  }
}

Future Signin({
  required String email,
  required String password,
}) async {
  try {
    UserCredential? usercred = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user1 = usercred.user;

    if (user1 != null) {
      Get.toNamed('/drawer');
    } else {
      print('not signed in');
    }
  } on FirebaseException catch (e) {
    print(e);
  }
}

Future Signout() async {
  await auth.signOut();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('rememberMe', false);
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
