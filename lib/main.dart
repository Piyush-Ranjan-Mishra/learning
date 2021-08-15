import 'package:flutter/material.dart';
import 'package:learning_people/Utils/style.dart';
import 'package:learning_people/screens/Logins/loginScreen.dart';
import 'package:learning_people/screens/home/home.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'bloc/screen/loginBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      theme: ThemeData(
        primaryColor: Color(0xff292e5b),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: primaryColor,
          displayColor: primaryColor,
        ),
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  StartPage({
    Key key,
  }) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final LoginBloc bloc = LoginBloc.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: bloc.loginListener,
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) =>
          snapshot.data ? Home() : LoginScreen(),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
