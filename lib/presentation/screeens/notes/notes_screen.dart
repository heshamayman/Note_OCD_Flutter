import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/business_logic/notes/notes_cubit.dart';
import 'package:odc/business_logic/notes/notes_state.dart';
import 'package:odc/data/data_provider/local/sql_helperl.dart';
import 'package:odc/presentation/constants/constants.dart';
import 'package:odc/presentation/styles/colors.dart';
import 'package:odc/presentation/views/custom_text.dart';
import 'add_notes_screen.dart';
import 'details_of_note_screen.dart';

//This screen use for show all the list of notes
class NotesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    NotesCubit notesCubit = NotesCubit.get(context);
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is DatabaseCreate)
        {
          notesCubit.initialize();

        }

      },
      builder: (context, state) {
        NotesCubit notesCubit = NotesCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: transparent,
            elevation: 0,
            centerTitle: true,
            title: CustomText(
              text: "Notes",
              fontSize: 28,
              weight: FontWeight.w500,
              textColor: Colors.black,
            ),
            leading: IconButton(
              onPressed: ()
              {
                return Navigator.pop(context);
              },
              icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: black, size: 30),
            ),
          ),

          body: Padding(
            padding: const EdgeInsets.all(12),
            child: FutureBuilder(
              future: HelperSql.getAllRowsDB(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
              {

                if (snapshot.hasData)
                {
                  //if there's no data in the list of notes
                  if (snapshot.data.length == 0)
                  {
                    return Center(
                        child: CustomText(
                          text: "There's No Data To Show",
                          fontSize: titleFont,
                          weight: FontWeight.w500,
                          textColor: Colors.black,
                        ));
                  }

                  //if there's  data in the list of notes
                  else
                  {
                    return ListView.separated(
                      separatorBuilder: (BuildContext context, int index)
                      {
                        return  SizedBox();
                      },
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                          //list of notes
                          child: ListTile(
                            onTap: ()
                            {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context)
                                  {
                                    return DetailsOfNoteScreen(
                                      title: snapshot.data[index].title,
                                      date: snapshot.data[index].date,
                                      description: snapshot.data[index].description,
                                    );
                                  }));
                            },

                            //title of note
                            title: CustomText(
                              text: "${snapshot.data[index].title}",
                              fontSize: titleFont,
                              weight: FontWeight.bold,
                              textColor: black,
                            ),

                            //date of note
                            subtitle: CustomText(
                              text: "${snapshot.data[index].date}",
                              fontSize: titleFont,
                              weight: FontWeight.w400,
                              textColor: black,
                            ),

                            //btn edit + btn delete
                            trailing: Wrap(
                              children: [

                                //btn edit
                                IconButton(
                                  onPressed: ()
                                  {
                                    notesCubit.getOneData(
                                        context,
                                        snapshot.data[index].id ,
                                        snapshot.data[index].title,
                                        snapshot.data[index].description,
                                        snapshot.data[index].date);
                                  },
                                  icon: const Icon(Icons.edit),
                                  iconSize: deleteSize,
                                  color: primaryColor,
                                ),

                                //btn delete
                                IconButton(
                                  onPressed: ()
                                  {
                                    notesCubit.delete(snapshot.data[index].id);
                                  },
                                  icon: const Icon(Icons.delete),
                                  iconSize: deleteSize,
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ),
                        );
                      },

                    );
                  }
                }

                else
                {
                  return  const Center(child: CircularProgressIndicator());
                }
              },


            ),
          ),



          floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return AddNotesScreen();
                  }));
            },
            child:  Icon(
              Icons.add,
              color: white,
            ),
          ),
        );
      },
    );
  }


}
