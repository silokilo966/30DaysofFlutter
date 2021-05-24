import 'package:flutter/material.dart';
import 'package:learning_flutter/pages/login_page.dart';
import 'package:learning_flutter/pages/utils/routes.dart';
import 'package:learning_flutter/widgets/themes.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //int days = 30;
    //String name = "Saeed";
    //dobule pi = 3.14
    //num (can be both int or double)
    //bool TrueORFalese = true; (if its true or false)
    //var day = "Tuesday" or = 5; (can be int or string or anything)
    //const pi = 3.14; (constant values that never change)
    //final (can be changed when addition is done)

    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}
