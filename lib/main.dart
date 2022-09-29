import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/business_logic/auth/login/login_cubit.dart';
import 'package:odc/business_logic/auth/signup/signup_cubit.dart';
import 'package:odc/business_logic/faq/faq_cubit.dart';
import 'package:odc/business_logic/news/news_cubit.dart';
import 'package:odc/business_logic/notes/notes_cubit.dart';
import 'package:odc/data/data_provider/local/cache_helper.dart';
import 'package:odc/data/data_provider/remote/dio_helper.dart';
import 'package:odc/presentation/screeens/settings/faq_screen.dart';
import 'package:odc/presentation/screeens/settings/settings_screen.dart';
import 'package:odc/presentation/screeens/splash/splash_screen.dart';
import 'package:odc/presentation/styles/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => NotesCubit()),
        BlocProvider(create: (context) => NewsCubit()..getNews()),
        BlocProvider(create: (context) => FaqCubit()..getFAQ()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ODC',
        theme: ThemeData(
          /// TODO : Implement Circular Progress Indicator Theme.
          /// Primary Color
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor))),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
            primary: primaryColor,
            side: const BorderSide(color: primaryColor),
          )),
          backgroundColor: Colors.teal,
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
