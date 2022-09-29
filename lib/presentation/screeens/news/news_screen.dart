import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/business_logic/news/news_cubit.dart';
import 'package:odc/presentation/styles/colors.dart';
import 'package:odc/presentation/views/custom_text.dart';
import 'package:odc/presentation/views/news_card.dart';

//This screen use for get news
class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  /// TODO : Layout Screen widgets with Dummy Data by replacing with progress Indicator.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        NewsCubit myCubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: CustomText(
              text: "News",
              fontSize: 28,
              weight: FontWeight.w500,
              textColor: Colors.black,
            ),
          ),
          body: ConditionalBuilder(
            condition:
                myCubit.newsModel != null && myCubit.newsModel!.news.isNotEmpty,
            builder: (context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  SizedBox(height: 8),
                  Expanded(
                      child: ListView.builder(
                    itemCount: myCubit.newsModel!.news.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                        news: myCubit.newsModel!.news[index],
                      );
                    },
                  ))
                ]),
              );
            },
            fallback: (context) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
