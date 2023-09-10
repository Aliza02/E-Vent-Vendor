import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../controller/services.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
final servicecontroller = Get.put(serviceController());
final id = auth.currentUser!.uid;
String serviceName = servicecontroller.serviceName.text;
Future addServices(
    {required String serviceName,
    required String serviceDescription,
    required String priceRange,
    required String noOfPerson,
    required String image1URL,
    required String image2URL,
    required String image3URL}) async {
  await firestore
      .collection("Services")
      .doc(servicecontroller.currentUserBusinessCategory.value)
      .set({"userName": ''});
  await firestore
      .collection('Services')
      .doc(servicecontroller.currentUserBusinessCategory.value)
      .collection(id)
      .doc(serviceName)
      .set(
    {
      'Service Name': serviceName,
      'Service Description': serviceDescription,
      'Service Price': priceRange,
      'NoOfPerson': noOfPerson,
      'image1': image1URL.isEmpty ? '' : image1URL,
      'image2': image2URL.isEmpty ? '' : image2URL,
      'image3': image3URL.isEmpty ? '' : image3URL,
    },
  );
}

Future deleteService(String serviceName) async {
  await firestore
      .collection('Services')
      .doc(servicecontroller.currentUserBusinessCategory.value)
      .collection(id)
      .doc(serviceName)
      .delete();
}

Future updateService(String serviceName, String serviceDescription,
    String priceRange, String noOfPerson) async {
  await firestore
      .collection('Services')
      .doc(servicecontroller.currentUserBusinessCategory.value)
      .collection(id)
      .doc(serviceName)
      .update({
    'Service Description': serviceDescription,
    'Service Price': priceRange,
    'NoOfPerson': noOfPerson
  });
}
