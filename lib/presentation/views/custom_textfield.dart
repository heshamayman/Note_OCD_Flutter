import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/presentation/styles/colors.dart';
import 'package:odc/presentation/widgets/custom_border_textfield.dart';



class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String title;
  Function validation;


  CustomTextField({
    this.controller,
    required this.title,
    required this.validation
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (val)
        {
          return validation(val);
        },
        controller: controller,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          labelText: title,
          floatingLabelStyle: GoogleFonts.poppins(color: primaryColor),
          enabledBorder: customBorder(grey),
          focusedBorder: customBorder(primaryColor),
          errorBorder: customBorder(red),
          focusedErrorBorder: customBorder(red),
        ));
  }
}
