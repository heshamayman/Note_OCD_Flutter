import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/business_logic/faq/faq_cubit.dart';
import 'package:odc/business_logic/faq/faq_state.dart';
import 'package:odc/presentation/styles/colors.dart';
import 'package:odc/presentation/views/custom_text.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:toggle_list/toggle_list.dart';


//This screen is use for get frequency of questions and answer
class FAQScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<FaqCubit, FaqState>(
      listener: (BuildContext context, state) {},

      builder: (BuildContext context, Object? state)
      {

        FaqCubit faqCubit = FaqCubit.get(context);

        return Scaffold(
            appBar: AppBar(
              backgroundColor: transparent,
              elevation: 0,
              centerTitle: true,
              title: CustomText(
                text: "FAQ",
                fontSize: 28,
                weight: FontWeight.w500,
                textColor: Colors.black,
              ),
              leading: IconButton(
                onPressed: () {
                  return Navigator.pop(context);
                },
                icon:
                    const Icon(Icons.arrow_back_ios_rounded, color: black, size: 30),
              ),
            ),
            body: (state is FaqLoading || faqCubit.faqModel == null)
                ? const Center(child: CircularProgressIndicator())
                : Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: faqCubit.faqModel?.List_FAQData.length,
                      itemBuilder: (BuildContext context, int index) {
                        //card of question & answer
                        return Card(
                          margin: const EdgeInsets.all(20),
                          elevation: 7,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: ToggleList(
                            shrinkWrap: true,
                            toggleAnimationDuration:
                            const Duration(milliseconds: 400),
                            scrollPosition: AutoScrollPosition.begin,
                            children: [
                              //toggle question
                              ToggleListItem(
                                itemDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    ),

                                headerDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    ),

                                title: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: RichText(
                                        text: HTML.toTextSpan(
                                        context,
                                        "${faqCubit.faqModel!.List_FAQData[index].question}",
                                        defaultTextStyle: const TextStyle(
                                           fontWeight: FontWeight.bold,
                                           color: black,
                                           decoration: TextDecoration.none,
                                           fontSize: 17.0,
                                      ),
                                    )),
                                  ),
                                ),


                                //toggle answer
                                content: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: RichText(
                                        text: HTML.toTextSpan(
                                        context,
                                        "${faqCubit.faqModel!.List_FAQData[index].answer}",
                                        defaultTextStyle: const TextStyle(
                                           fontWeight: FontWeight.bold,
                                           color: black,
                                           decoration: TextDecoration.none,
                                           fontSize: 17.0,
                                      ),
                                    ))),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                ));
      },
    );
  }

}
