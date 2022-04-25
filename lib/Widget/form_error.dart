import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => FormErrorText(errorText: errors[index]),
      ),
    );
  }

  Row FormErrorText({required String errorText}) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          height: 14,
        ),
        SizedBox(width: 10),
        Text(errorText),
      ],
    );
  }
}
