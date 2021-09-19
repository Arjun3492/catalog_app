import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'routes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      scrollBehavior: MyBehavior(),
      debugShowCheckedModeBanner: false,
      title: "Catalog App",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      initialRoute: myRoutes.login,
      routes: {
        myRoutes.home: (context) => HomePage(),
        myRoutes.login: (context) => LoginPage(),
      },
    );
  }
}
