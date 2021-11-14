// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFeild extends StatelessWidget {
  final String? hinttxt;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;

  const CustomTextFeild({
    Key? key,
    required this.textInputType,
    this.hinttxt,
    this.textEditingController,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
        autovalidate: true,
        maxLength: 1,
        keyboardType: textInputType,
        controller: textEditingController,
        maxLines: 2,
        decoration: InputDecoration(
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
            hintText: hinttxt,
            counterText: "",
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.6)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.6)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.6)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.6))));
  }
}
