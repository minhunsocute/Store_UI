import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/defaultButton.dart';
import 'package:flutter_application_1/Widget/form_error.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/models/all_errors.dart';
import 'package:flutter_application_1/screens/Sign_up/confirm_profile_screen.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_svg/svg.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp({Key? key}) : super(key: key);

  @override
  State<FormSignUp> createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  @override
  final _formKey = GlobalKey<FormState>();
  late String email = '';
  late String password = '';
  late String confirm_password = 'dfsfsdf';
  bool _isObcurse = true;
  bool _isObcurse_confirm = true;
  List<String> errors = [];
  bool check_same_confirm_pass() {
    if (errors.contains(kMatchPassError) || errors.contains(kConfirmNullError))
      return false;
    return true;
  }

  bool check_email() {
    if (errors.contains(kEmailNullError) || errors.contains(kInvalidEmailError))
      return false;
    return true;
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormFeild(),
          SizedBox(height: 29),
          buildPassFormFeild(),
          SizedBox(height: 29),
          buildPassConfirmFormFeild(),
          SizedBox(height: 30),
          FormError(errors: errors),
          SizedBox(height: 30),
          DefaultButton(
            tittle: 'Continue',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
              if (errors.length == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComfirmProfile(),
                  ),
                );
              }
              print(errors);
              print((password == confirm_password) ? true : false);
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPassFormFeild() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: _isObcurse,
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
          setState(() {
            errors.add(kPassNullError);
          });
        }
        return null;
      },
      style: TextStyle(color: Colors.black, fontSize: 16),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: (errors.contains(kPassNullError) ? Colors.red : primaryColor),
        ),
        labelText: "Password",
        hintText: "Enter your Password",
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color:
                (errors.contains(kPassNullError) ? Colors.red : primaryColor),
          ),
          gapPadding: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color:
                (errors.contains(kPassNullError) ? Colors.red : primaryColor),
          ),
          gapPadding: 10,
        ),
        suffixIcon: IconButton(
          padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          onPressed: () {
            setState(() {
              _isObcurse = !_isObcurse;
            });
          },
          icon: Icon(
            (_isObcurse) ? Icons.visibility : Icons.visibility_off,
            color:
                (errors.contains(kPassNullError) ? Colors.red : primaryColor),
          ),
        ),
      ),
    );
  }

  TextFormField buildPassConfirmFormFeild() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: _isObcurse_confirm,
      onSaved: (value) => confirm_password = value!,
      style: TextStyle(color: Colors.black, fontSize: 16),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: (!check_same_confirm_pass()) ? Colors.red : primaryColor,
        ),
        labelText: "Confirm Password",
        hintText: "Re-enter your Password",
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: (!check_same_confirm_pass()) ? Colors.red : primaryColor,
          ),
          gapPadding: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: (!check_same_confirm_pass()) ? Colors.red : primaryColor,
          ),
          gapPadding: 10,
        ),
        suffixIcon: IconButton(
          padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          onPressed: () {
            setState(() {
              _isObcurse_confirm = !_isObcurse_confirm;
            });
          },
          icon: Icon(
            (_isObcurse_confirm) ? Icons.visibility : Icons.visibility_off,
            color: (!check_same_confirm_pass()) ? Colors.red : primaryColor,
          ),
        ),
      ),
      onChanged: (value) {
        if (password == confirm_password) {
          setState(() {
            errors.remove(kMatchPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (password != confirm_password && !errors.contains(kMatchPassError)) {
          setState(() {
            errors.add(kMatchPassError);
          });
          return null;
        } else if (password == confirm_password) {
          return null;
        }
        return null;
      },
    );
  }

  TextFormField buildEmailFormFeild() {
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
          color: !check_email() ? Colors.red : primaryColor,
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
            color: !check_email() ? Colors.red : primaryColor,
          ),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: !check_email() ? Colors.red : primaryColor,
          ),
          gapPadding: 10,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          child: SvgPicture.asset(
            "assets/icons/Mail.svg",
            color: !check_email() ? Colors.red : primaryColor,
          ),
        ),
      ),
    );
  }
}
