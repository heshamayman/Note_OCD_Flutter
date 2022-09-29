import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc/presentation/styles/colors.dart';
import 'package:odc/presentation/widgets/custom_border_textfield.dart';

//This class used for textfield of notes
class CustomNotesTextField extends StatelessWidget {
  String labelText;
  String hintText;
  Function validation;
  Function onChanged;
  int maxLines;
  TextEditingController editController;
  String startValue;

  CustomNotesTextField({
    required this.labelText,
    required this.hintText,
    required this.validation,
    required this.onChanged,
    required this.maxLines,
    required this.editController,
    this.startValue = ""
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      initialValue: startValue,
      validator: (value)
      {
        return validation(value);
      },

        cursorColor: primaryColor,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: labelText,
          hintText: hintText,

          floatingLabelStyle: GoogleFonts.poppins(color: primaryColor),

          enabledBorder: customBorder(grey),
          focusedBorder: customBorder(primaryColor),
          errorBorder: customBorder(red),
          focusedErrorBorder: customBorder(red)),

      onChanged: (value)
      {
         onChanged(value);
      },
    );
  }


}
