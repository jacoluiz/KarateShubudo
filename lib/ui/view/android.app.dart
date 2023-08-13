import 'package:flutter/material.dart';
import 'package:karate_shubudo/ui/view/home.page.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Karate',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
