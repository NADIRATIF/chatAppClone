import 'package:chat_clone/constants.dart';
import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
    required this.hintText,
    required this.validator,
    this.obscureValue = false,
    this.keyboardInputType = TextInputType.text,
  }) : super(key: key);
  final String hintText;
  final FormFieldValidator validator;
  final bool obscureValue;
  final TextInputType keyboardInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding,
      child: TextFormField(
        keyboardType: keyboardInputType,
        obscureText: obscureValue,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: kBorderSide,
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: kBorderSide,
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: kBorderSideError,
            borderRadius: BorderRadius.circular(30.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: kBorderSideError,
            borderRadius: BorderRadius.circular(30.0),
          ),
          hintStyle: kHintStyle,
          hintText: hintText,
        ),
        validator: validator,
      ),
    );
  }
}
