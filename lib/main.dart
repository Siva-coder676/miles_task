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
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final homeRepository = HomeService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => HomePageController(
            homeService: homeRepository
          ),
          lazy: true,
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: HomePage()),
    );
  }
}
