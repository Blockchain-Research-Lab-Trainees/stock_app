import 'package:flutter/material.dart';
import 'Pages/DetailStock.dart';
import 'Pages/FirstPage.dart';
import 'Pages/SearchPage.dart';
import 'Pages/signup_auth.dart';
import 'utils/Routes.dart';
import 'package:flutter/services.dart';
import 'package:stock_app/Pages/HttpPage.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
        '/': (context) => FirstPage(),
        MyRoutes.HttpPageRoutes: (context) => HttpPage(),
        MyRoutes.FirstPageRoutes:(context) => FirstPage(),
        MyRoutes.SearchPageRoutes:(context) => SearchPage(),
        // MyRoutes.Login_auth:(context) => Login(),
        }
    );
  }
}
