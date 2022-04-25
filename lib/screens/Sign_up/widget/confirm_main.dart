import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Widget/form_error.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/models/all_errors.dart';
import 'package:flutter_application_1/screens/otp/otp_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Widget/defaultButton.dart';

class Confirm_main extends StatefulWidget {
  const Confirm_main({Key? key}) : super(key: key);

  @override
  State<Confirm_main> createState() => _Confirm_mainState();
}

class _Confirm_mainState extends State<Confirm_main> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String firt_name;
  late String last_name;
  late String phone_number;
  late String Address;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: 29),
          buildLastNameFormField(),
          SizedBox(height: 29),
          buildPhonenumberFormField(),
          SizedBox(height: 29),
          buildAddressFormField(),
          SizedBox(height: 29),
          FormError(errors: errors),
          SizedBox(height: 29),
          DefaultButton(
            tittle: 'Continue',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (errors.length == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => otp_screen(),
                    ),
                  );
                }
              }
              print(errors);
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (value) => Address = value!,
      onChanged: (value) {
        if (value.length != 0 && errors.contains(kAddressNullError)) {
          setState(() {
            errors.remove(kAddressNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.length == 0 && !errors.contains(kAddressNullError)) {
          setState(() {
            errors.add(kAddressNullError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: errors.contains(kAddressNullError) ? Colors.red : primaryColor,
        ),
        labelText: 'Address',
        hintText: 'Enter your Address',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color:
                errors.contains(kAddressNullError) ? Colors.red : primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color:
                errors.contains(kAddressNullError) ? Colors.red : primaryColor,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          child: SvgPicture.asset(
            'assets/icons/Location point.svg',
            color:
                errors.contains(kAddressNullError) ? Colors.red : primaryColor,
          ),
        ),
      ),
    );
  }

  TextFormField buildPhonenumberFormField() {
    return TextFormField(
      onSaved: (value) => phone_number = value!,
      onChanged: (value) {
        if (value.length != 0 && errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.remove(kPhoneNumberNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.length == 0 && !errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.add(kPhoneNumberNullError);
          });
        }
        return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: errors.contains(kPhoneNumberNullError)
              ? Colors.red
              : primaryColor,
        ),
        labelText: 'Phone number',
        hintText: 'Enter your phone number',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: errors.contains(kPhoneNumberNullError)
                ? Colors.red
                : primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: errors.contains(kPhoneNumberNullError)
                ? Colors.red
                : primaryColor,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          child: SvgPicture.asset(
            'assets/icons/phone.svg',
            color: errors.contains(kPhoneNumberNullError)
                ? Colors.red
                : primaryColor,
          ),
        ),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (value) => last_name = value!,
      onChanged: (value) {
        if (value.length != 0 && errors.contains(kLastNameNullError)) {
          setState(() {
            errors.remove(kLastNameNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.length == 0 && !errors.contains(kLastNameNullError)) {
          setState(() {
            errors.add(kLastNameNullError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        labelStyle: TextStyle(
          color:
              errors.contains(kLastNameNullError) ? Colors.red : primaryColor,
        ),
        labelText: "Last Name",
        hintText: "Enter yout Last Name",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color:
                errors.contains(kLastNameNullError) ? Colors.red : primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color:
                errors.contains(kLastNameNullError) ? Colors.red : primaryColor,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          child: SvgPicture.asset(
            'assets/icons/User.svg',
            color:
                errors.contains(kLastNameNullError) ? Colors.red : primaryColor,
          ),
        ),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (value) => firt_name = value!,
      onChanged: (value) {
        if (value.length != 0 && errors.contains(kFirstNameNullError)) {
          setState(() {
            errors.remove(kFirstNameNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.length == 0 && !errors.contains(kFirstNameNullError)) {
          setState(() {
            errors.add(kFirstNameNullError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(
            color: errors.contains(kFirstNameNullError)
                ? Colors.red
                : primaryColor),
        labelText: 'Fist Name',
        hintText: 'Enter your First Name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: (errors.contains(kFirstNameNullError)
                ? Colors.red
                : primaryColor),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: (errors.contains(kFirstNameNullError)
                ? Colors.red
                : primaryColor),
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          child: SvgPicture.asset(
            'assets/icons/User.svg',
            color: errors.contains(kFirstNameNullError)
                ? Colors.red
                : primaryColor,
          ),
        ),
      ),
    );
  }
}
