import 'package:flutter/material.dart';
import 'package:miles_task/core/controllers/home_page_controller.dart';
import 'package:miles_task/core/service/home_service.dart';
import 'package:miles_task/core/theme.dart';
import 'package:miles_task/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color colorBlack = Color(0XFFb333333);
  final Color colorWhite = Color(0XFFFFFFFF);
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final homeRepository = HomeService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => HomePageController(homeService: homeRepository),
          lazy: true,
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(
            primaryColor: colorBlack, // Primary color of the app
            scaffoldBackgroundColor:
                colorBlack, // Background color for the scaffold
            appBarTheme: AppBarTheme(
              backgroundColor: colorBlack, // AppBar color
              iconTheme: IconThemeData(color: colorWhite), // AppBar icon color
              // textTheme: TextTheme(
              //   headline6: TextStyle(
              //     color: colorWhite, // AppBar title color
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(color: colorWhite), // Body text color
              bodyText2: TextStyle(color: colorWhite), // Body text color
            ),
            iconTheme: IconThemeData(
              color: colorWhite, // Default icon color
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: colorBlack, // Default button color
              textTheme: ButtonTextTheme.primary, // Text color of buttons
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: colorBlack, // FloatingActionButton color
              foregroundColor:
                  colorWhite, // FloatingActionButton text/icon color
            ),
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: colorBlack, // Bottom sheet color
            ),
          ),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: HomePage()),
    );
  }
}
