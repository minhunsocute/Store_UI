import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/app_bar.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/screens/otp/widget/otp_form.dart';

class Body_Otp extends StatefulWidget {
  const Body_Otp({Key? key}) : super(key: key);

  @override
  State<Body_Otp> createState() => _Body_OtpState();
}

class _Body_OtpState extends State<Body_Otp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              AppBar_design(tittle: 'OTP Verification'),
              SizedBox(height: 40),
              Text(
                'OTP Verification',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: "Mui",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "We sent your code to +89 3570 ****",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("This code will expired in"),
                  // TweenAnimationBuilder(
                  //   tween: Tween(begin: 30.0, end: 0),
                  //   duration: Duration(seconds: 30),
                  //   builder: (context, value, child) => Text(
                  //     "00:${value.toString()}",
                  //     style: TextStyle(
                  //       color: primaryColor,
                  //     ),
                  //   ),
                  // )
                  Text("00:30", style: TextStyle(color: primaryColor)),
                ],
              ),
              SizedBox(height: 100),
              OTPform(),
              SizedBox(height: 80),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Resend OTP Code",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
