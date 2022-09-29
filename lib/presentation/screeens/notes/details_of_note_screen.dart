import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/presentation/constants/constants.dart';
import 'package:odc/presentation/styles/colors.dart';
import 'package:odc/presentation/views/custom_text.dart';


//This screen is details of note
class DetailsOfNoteScreen extends StatelessWidget {

  String? description;
  String? title;
  var date;


  DetailsOfNoteScreen({
    required this.description,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: ()
            {
              return Navigator.pop(context);
            },
            icon:
            const Icon(
                Icons.arrow_back_ios_rounded,
                color: black, size: 30),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [

              //Title
              SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.only(left:30),
                child: CustomText(
                  text: '$title',
                  textColor: black,
                  weight: FontWeight.bold,
                  fontSize: titleInfoFont,
                ),
              ),

              //Date
              Container(
                margin: EdgeInsets.only(left:30),
                child: CustomText(
                  text: '$date',
                  textColor: black,
                  fontSize: dateFont  ,
                ),
              ),

              //Description
              SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(left:30),
                child: Text("${description}",
                    style: TextStyle(
                      fontSize: subtitleInfoFont,
                    )),
              ),


            ],
          ),
        )

    );
  }
}
