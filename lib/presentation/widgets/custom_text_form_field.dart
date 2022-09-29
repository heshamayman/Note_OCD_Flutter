
import 'package:flutter/material.dart';
import 'package:odc/presentation/styles/colors.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.ic,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.visibleText = false,
    this.onTap,
    this.isPassword = false,
  }) : super(key: key);

  final String hintText;
  TextEditingController controller;
  final Function validator;
  bool visibleText;
  bool isPassword;
  Icon ic ;

  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        return validator(val);
      },
      controller: controller,
      obscureText: visibleText,
      decoration: InputDecoration(
        labelText: hintText,
        fillColor: primaryColor,
        labelStyle: TextStyle(color: primaryColor),
        focusedBorder:OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor , width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        suffixIcon:isPassword? InkWell(
          onTap:onTap ,
          child: Icon(
            visibleText ?  Icons.visibility_off :Icons.visibility  ,
            color: primaryColor,
          ),

        ):SizedBox(),
        prefixIcon: ic ,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(),

        ),
      ),
    );
  }
}
