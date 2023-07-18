import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../controller/signinController.dart';
import '../controller/signupController.dart';

FirebaseAuth auth = FirebaseAuth.instance;
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

    // print(auth.currentUser!.displayName!.toString());
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

    // await FirebaseFirestore.instance.collection('User').add({
    //   'name': name,
    //   'email': email,
    //   'password': password,
    //   'confirmPassword': confirmPassword,
    //   'Business Name': businessName,
    //   'Business Category': businessCategory,
    //   'Business Location': businessLocation,
    //   'CNIC': CNIC,
    //   'Phone': phone,
    // });
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

    // print(auth.currentUser!.displayName!.toString());
    if (user1 != null) {
      Get.toNamed('/drawer');
    } else {
      print('not signed in');
    }

    // User? user = abc.user;
    // if (user != null) {
    //   print(user!.displayName.toString());
    // } else {
    //   print('fdf');
    // }
  } on FirebaseException catch (e) {
    print(e);
  }
}
