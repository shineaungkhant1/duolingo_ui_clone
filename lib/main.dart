import 'package:duolingo_ui_clone/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        textTheme: Typography().black.apply(fontFamily: 'DinNextRounded'),
      ),
      home: const HomePage(),
    );
  }
}
