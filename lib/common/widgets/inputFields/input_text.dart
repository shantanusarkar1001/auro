import 'package:auro/utils/validate/validate.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../utils/constant/colors.dart';

class PrefixInputText extends StatelessWidget {
  const PrefixInputText({
    super.key,
    required this.hint,
    required this.preFixIcon,
    required this.keyboardType,
    this.maxLength,
    this.suffixIcon,
    this.controller,
  });

  final String hint;
  final Icon preFixIcon;
  final TextInputType keyboardType;
  final int? maxLength;
  final Icon? suffixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        validator: (value) => Validate.validatePhoneNumber(value),
        keyboardType: keyboardType,
        maxLength: maxLength,
        style: const TextStyle(color: TColors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: TColors.white),
          prefixIcon: preFixIcon,
          fillColor: TColors.primaryDark2,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
            borderSide: BorderSide.none, // Removes the default border
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
            borderSide: BorderSide.none, // Removes the border when enabled
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
            borderSide: BorderSide.none, // Removes the border when focused
          ),
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: CircleAvatar(
                    radius: 12.0,
                    backgroundColor: TColors.green,
                    child: suffixIcon,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
