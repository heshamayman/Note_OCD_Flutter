import 'package:flutter/material.dart';
import 'package:odc/presentation/styles/colors.dart';
import 'package:odc/presentation/views/custom_text.dart';



class SupportScreen extends StatelessWidget {
  SupportScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: CustomText(
              text: "Support",
              fontSize: 22,
              weight: FontWeight.w600,
              textColor: Colors.black),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
               SizedBox(height:10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        prefixIconColor: primaryColor,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        hintText: "Name",
                        filled: true,
                        focusedBorder: customBorder(color: primaryColor),
                        border: customBorder(color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        prefixIconColor: primaryColor,
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: Colors.grey,
                        ),
                        hintText: "E-Mail",
                        filled: true,
                        focusedBorder: customBorder(color: primaryColor),
                        border: customBorder(color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    minLines: 5,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: "What's making you unhappy?",
                        filled: true,
                        focusedBorder: customBorder(color: primaryColor),
                        border: customBorder(color: Colors.grey)),
                  ),
                ),
                SizedBox(height:20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(child: Text( "Submit"),onPressed: (){}),
                )
              ],
            ),
          )),
    );
  }

  OutlineInputBorder customBorder({required Color color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color, width: 2));
  }
}
