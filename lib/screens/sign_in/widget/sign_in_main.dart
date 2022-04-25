import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home_page.dart';
import 'package:flutter_application_1/Widget/defaultButton.dart';
import 'package:flutter_application_1/Widget/form_error.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/models/all_errors.dart';
import 'package:flutter_application_1/screens/forgetPass/forget_pass_screen.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_application_1/screens/login_success/login_succes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInMainForm extends StatefulWidget {
  const SignInMainForm({Key? key}) : super(key: key);

  @override
  State<SignInMainForm> createState() => _SignInMainFormState();
}

class _SignInMainFormState extends State<SignInMainForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  bool _isObscure = true;
  late String email;
  late String password;
  late bool remember_account = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          builtEmailFormField(),
          SizedBox(height: 29),
          builtPassFormField(),
          SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  activeColor: primaryColor,
                  value: remember_account,
                  onChanged: (value) {
                    setState(() {
                      remember_account = value!;
                    });
                  },
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  'Remember Account',
                  style: TextStyle(fontSize: 15),
                ),
                Spacer(flex: 7),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPass_screen(),
                      ),
                    );
                  },
                  child: Text(
                    'Forget password',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                        color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 11),
          FormError(errors: errors),
          SizedBox(height: 25),
          DefaultButton(
            tittle: 'Continue',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
              if (email == 'h@gmail.com') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginSuccess(),
                  ),
                );
              }
              print(email + ',' + password);
            },
          ),
        ],
      ),
    );
  }

  TextFormField builtPassFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: _isObscure,
      onSaved: (value) => password = value!,
      onChanged: (value) {
        if (value.length != 0 && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.length == 0 && !errors.contains(kPassNullError)) {
          errors.add(kPassNullError);
        }
        return null;
      },
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: errors.contains(kPassNullError) ? Colors.red : primaryColor,
        ),
        labelText: "Password",
        hintText: "Enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: errors.contains(kPassNullError) ? Colors.red : primaryColor,
          ),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: errors.contains(kPassNullError) ? Colors.red : primaryColor,
          ),
          gapPadding: 10,
        ),
        suffixIcon: IconButton(
          padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
            color: errors.contains(kPassNullError) ? Colors.red : primaryColor,
          ),
        ),
      ),
    );
  }

  TextFormField builtEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => email = value!,
      onChanged: (value) {
        //tu dong update data moi khi ma nguoi dung thay doi text trong textFoermField
        if (value.length != 0 && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (value.length != 0 && emailValidatorRegExp.hasMatch(value)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value?.length == 0 && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
            errors.remove(kInvalidEmailError);
          });
        } else if (value?.length != 0 &&
            !emailValidatorRegExp.hasMatch(value!)) {
          if (!errors.contains(kInvalidEmailError)) {
            setState(() {
              errors.add(kInvalidEmailError);
            });
          }
        }
        return null;
      },
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: errors.contains(kEmailNullError) ? Colors.red : primaryColor,
        ),
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: errors.contains(kEmailNullError) ? Colors.red : primaryColor,
          ),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: errors.contains(kEmailNullError) ? Colors.red : primaryColor,
          ),
          gapPadding: 10,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          child: SvgPicture.asset(
            "assets/icons/Mail.svg",
            color: errors.contains(kEmailNullError) ? Colors.red : primaryColor,
          ),
        ),
      ),
    );
  }
}
