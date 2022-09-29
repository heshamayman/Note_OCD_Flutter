import 'package:flutter/material.dart';
import 'package:odc/presentation/views/custom_text.dart';



class CustomTile extends StatelessWidget {
  CustomTile({Key? key, required this.title , required this.onClick}) : super(key: key);

  String title;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onClick(),
      //list tile title
      title: CustomText(
        text: title,
        fontSize: 15,
        weight: FontWeight.normal,
        textColor: Colors.black,
      ),
      //list tile icon
      trailing: Icon(Icons.arrow_forward_ios_sharp),
    );
  }
}
