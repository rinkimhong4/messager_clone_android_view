import 'package:flutter/material.dart';
import 'package:messager_clone_android_view/views/widgets/bottom_navigation_bar_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message UI Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const BottomNavigationBarWidget(),
    );
  }
}
