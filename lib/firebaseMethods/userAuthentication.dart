import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/signinController.dart';
import '../controller/signupController.dart';
import '../main.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final signupcontroller = Get.put(signUpController());
final signincontroller = Get.put(signinController());
UserCredential? userCredentials;
User? user;

var verification_Id;

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
    });
  } on FirebaseException catch (e) {
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

Future otpVerification(String phoneno) async {
  await auth.verifyPhoneNumber(
      phoneNumber: '+923313660299',
      verificationCompleted: (credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        if (e.code == 'invalid phone number') {
          Get.snackbar('Error', 'The provided number is invalid');
        } else {
          Get.snackbar('Error', 'Something went wrong, Try Again.');
        }
      },
      codeSent: (verificationId, resendToken) {
        verification_Id = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        verification_Id = verificationId;
      });
}

Future<bool> verifyOtp(String otp) async {
  var credentials = await auth.signInWithCredential(
      PhoneAuthProvider.credential(
          verificationId: verification_Id, smsCode: otp));
  return credentials.user != null ? true : false;
}

Future Signout() async {
  await auth.signOut();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('rememberMe', false);
}
