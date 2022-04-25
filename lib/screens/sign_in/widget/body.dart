import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/app_bar.dart';
import 'package:flutter_application_1/Widget/socal_card.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:flutter_application_1/screens/Sign_up/sign_up_screen.dart';
import 'package:flutter_application_1/screens/sign_in/widget/sign_in_main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body_signIn extends StatefulWidget {
  const Body_signIn({Key? key}) : super(key: key);

  @override
  State<Body_signIn> createState() => _Body_signInState();
}

class _Body_signInState extends State<Body_signIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              AppBar_design(tittle: 'Sign In'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    // make appbar
                    SizedBox(height: 20),
                    Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: "Mui",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign in with your email and password \nor continue with social media",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(height: 70),
                    SignInMainForm(),
                    SizedBox(height: 110),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Socal_card(
                          icon_path: 'assets/icons/google-icon.svg',
                          press: () {},
                        ),
                        Socal_card(
                          icon_path: 'assets/icons/facebook-2.svg',
                          press: () {},
                        ),
                        Socal_card(
                          icon_path: 'assets/icons/twitter.svg',
                          press: () {},
                        ),
                      ],
                    ),
                    no_accountText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class no_accountText extends StatelessWidget {
  const no_accountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Dont have an\'t account ? '),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ),
            );
          },
          child: Text(
            'Sign Up',
            style: TextStyle(color: primaryColor),
          ),
        )
      ],
    );
  }
}
