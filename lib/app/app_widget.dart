import 'package:flutter/material.dart';
import 'package:meupet/app/modules/auth/auth_module.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'meuPet',
      initialRoute: '/login',
      routes: {...AuthModule().routers},
    );
  }
}
