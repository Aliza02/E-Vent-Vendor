import 'package:emailjs/emailjs.dart';
import 'package:get/get.dart';
import 'package:otp/otp.dart';
import 'package:http/http.dart' as http;
import '../controller/signupController.dart';
import '../firebaseMethods/userAuthentication.dart';
import 'dart:convert';

final businessSignupController = Get.put(signUpController());

void generateOtp() {
  final userKey = auth.currentUser?.uid;
  businessSignupController.OTPCode.value = OTP.generateTOTPCodeString(
      userKey.toString(), DateTime.now().millisecondsSinceEpoch,
      interval: businessSignupController.secondsRemainingforOtp.value,
      algorithm: Algorithm.SHA512);
}

void sendOTP() {
  generateOtp();

  sendEmail(
    
  email:   businessSignupController.emailController.text,
     message:businessSignupController.OTPCode.value,
     subject:'OTP Verification',
  );
}
  void _sendEmail( String email,
    String subject,
     String message) async {
    try {
      await EmailJS.send(
        'service_jj7w46j',
        'template_msvsubc',
        {
           'to_email': email,
        'user_subject': subject,
        'message': message,
        },
        const Options(
          publicKey: 'i4Gwvjef3t3JpMTZh',
          privateKey: 's_UDdFSxxhjZ1z_2YX3yd',
        ),
      );
      print('SUCCESS!');
    } catch (error) {
      if (error is EmailJSResponseStatus) {
        print('ERROR... ${error.status}: ${error.text}');
      }
      print(error.toString());
    }
  }

Future sendEmail(
    {required String email,
    required String subject,
    required String message}) async {
  // print('send');
  const serviceId = 'service_jj7w46j';
  const templateId = 'template_msvsubc';
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  print(url);
  final response = await http.post(
    url,
    headers: {
      'origin': 'http://localhost',
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': 'i4Gwvjef3t3JpMTZh',
      'accessToken': 's_UDdFSxxhjZ1z_2YX3yd',
      'template_params': {
        'to_email': email,
        'user_subject': subject,
        'message': message,
      },
    }),
  );

  print(response.body);
}
