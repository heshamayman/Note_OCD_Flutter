import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/business_logic/notes/notes_cubit.dart';
import 'package:odc/business_logic/notes/notes_state.dart';
import 'package:odc/presentation/styles/colors.dart';
import 'package:odc/presentation/views/custom_notes_textfield.dart';
import 'package:odc/presentation/views/custom_text.dart';


//This class use for add new note
class AddNotesScreen extends StatelessWidget {


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
                text: "Add Note",
                fontSize: 28,
                weight: FontWeight.w500,
                textColor: Colors.black,
              ),
              leading: IconButton(
                onPressed: () {
                  return Navigator.pop(context);
                },
                icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: black, size: 30),
              ),
            ),

            body: Form(
              key: notesCubit.keyAddNote,
              child: Column(
                children: [

                  //Title
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: CustomNotesTextField(
                      maxLines: 1,
                      labelText: 'Title',
                      hintText: 'Enter Title',
                      validation: (val) {
                        if (val.isEmpty) {
                          return 'Please Enter Your Title';
                        }

                        else if (val.length > 50) {
                          return "Title must be less than 50 characters";
                        }
                      },
                      onChanged: (value) {
                        notesCubit.title = value;
                      },
                      editController: notesCubit.titleController,),
                  ),


                  //Description
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: CustomNotesTextField(
                      maxLines: 5,
                      labelText: 'Description',
                      hintText: 'Enter Description',
                      validation: (val) {
                        if (val.isEmpty) {
                          return 'Please Enter Your Description';
                        }
                      },
                      onChanged: (value) {
                        notesCubit.description = value;
                      },
                      editController: notesCubit.descriptionController,),
                  ),

                  //Button Add
                  Container(
                    width: 120,
                    margin: const EdgeInsets.only(top: 15.0),
                    child: ElevatedButton(onPressed: () {
                      if (notesCubit.keyAddNote.currentState!.validate()) {
                        notesCubit.insert(context);
                      }
                    }, child: Text('Add')),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
