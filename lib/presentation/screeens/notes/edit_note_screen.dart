import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:odc/business_logic/notes/notes_cubit.dart';
import 'package:odc/business_logic/notes/notes_state.dart';
import 'package:odc/presentation/styles/colors.dart';
import 'package:odc/presentation/views/custom_notes_textfield.dart';
import 'package:odc/presentation/views/custom_text.dart';



//This Screen use for edit a note
class EditNotesScreen extends StatelessWidget {

  String title;
  int id;
  String description;

  TextEditingController editTitle = TextEditingController();
  TextEditingController editDescription = TextEditingController();

  EditNotesScreen({
    required this.description,
    required this.id,
    required this.title,
  });



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(

      builder: (context, state) {
        NotesCubit notesCubit = NotesCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: transparent,
              elevation: 0,
              centerTitle: true,
              title: CustomText(
                text: "Edit",
                fontSize: 28,
                weight: FontWeight.w500,
                textColor: Colors.black,
              ),
              leading: IconButton(
                onPressed: () {
                  return Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded,
                    color: black, size: 30),
              ),
            ),

            body: Form(
              key: notesCubit.keyEditNote,
              child: Column(
                children: [

                  //Title
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: CustomNotesTextField(
                        startValue: title,
                        editController: editTitle,
                        maxLines:1,
                        labelText: 'Title',
                        hintText: 'Enter Title',
                        validation: (val)
                        {
                          if (val.isEmpty)
                          {
                            return 'Please Enter Your Title';
                          }

                          else if(val.length > 50)
                          {
                            return "Title must be less than 50 characters";
                          }
                        },
                        onChanged: (value)
                        {
                          editTitle.text = value;
                        }),
                  ),

                  //Description
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: CustomNotesTextField(
                        maxLines: 5,
                        labelText: 'Description',
                        hintText: 'Enter Description',
                        validation: (val) {
                          if (val.isEmpty)
                          {
                            return 'Please Enter Your Description';
                          }

                        },
                      startValue: description,
                        onChanged: (value) {
                          editDescription.text = value;
                          print("description: $value");
                        },
                      editController: editDescription,),
                  ),

                  //Button Edit
                  Container(
                    width: 120,
                    margin: const EdgeInsets.only(top: 15.0),
                    child: 
                    ElevatedButton(onPressed:() {

                      if (notesCubit.keyEditNote.currentState!.validate())
                      {
                        notesCubit.update(
                            context,
                            id,
                            DateFormat("hh:mm a      dd/MM/yyyy").format(DateTime.now()),

                            editTitle.text == ""
                                ? title
                                : editTitle.text,

                            editDescription.text == ""
                                ? description
                                : editDescription.text);

                      }
                    }, child: Text('Edit')),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
