import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/home.dart';
import 'package:study/knowledge/define.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Define()),
      ],
      child: MaterialApp(
        title: "Demo",
        routes: {
          '/index': (context) => Home(),
        },
        initialRoute: '/index',
      )
    );
  }
}
