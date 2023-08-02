import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

Future addServices(
    {required String serviceName,
    required String serviceDescription,
    required String princeRange,
    required String noOfPerson,
    required String image1URL,
    required String image2URL,
    required String image3URL}) async {
  await firestore.collection('Services').doc(auth.currentUser?.uid).set({
    'Service Name': serviceName,
    'Service Description': serviceDescription,
    'Service Price': princeRange,
    'Service Image': noOfPerson,
    'image1': image1URL.isEmpty ? '' : image1URL,
    'image2': image2URL.isEmpty ? '' : image2URL,
    'image3': image3URL.isEmpty ? '' : image3URL,
  });
}
