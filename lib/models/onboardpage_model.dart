import 'package:flutter/animation.dart';

class onboarding_model {
  onboarding_model({required this.description, required this.image});

  String description;
  String image;
}

List<onboarding_model> content = [
  onboarding_model(
      description:
          "Now reach out to more customers through this platform and see a tremendous increase in sales.",
      image: "assets/images/screen1.png"),
  onboarding_model(
      description:
          "Chat with customers, listen to their customization requests, decide on prices and much more.",
      image: "assets/images/screen2.png"),
  onboarding_model(
      description:
          "With availability feature, easily track all your bookings and never miss on any order",
      image: "assets/images/screen3.png"),
];
