import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/defaultButton.dart';
import 'package:flutter_application_1/Widget/form_error.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/models/all_errors.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_svg/svg.dart';

class FormForgetPass extends StatefulWidget {
  const FormForgetPass({Key? key}) : super(key: key);

  @override
  State<FormForgetPass> createState() => _FormForgetPassState();
}

class _FormForgetPassState extends State<FormForgetPass> {
  late String email;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormFieldEmail(),
          SizedBox(height: 24),
          FormError(errors: errors),
          SizedBox(height: 70),
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
                    builder: (context) => HomeScreenn(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField FormFieldEmail() {
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
