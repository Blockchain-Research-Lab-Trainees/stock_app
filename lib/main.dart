import 'package:flutter/material.dart';
import 'Pages/DetailStock.dart';
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
        '/': (context) => HttpPage(),
        MyRoutes.HttpPageRoutes: (context) => HttpPage(),
          // MyRoutes.DetailStock:(context) => DetailStock(),
        }
    );
  }
}
