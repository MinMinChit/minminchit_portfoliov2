import 'package:flutter/material.dart';
import 'package:mmc_portfoliov2/screens/home/home_screen.dart';

class MMCApp extends StatelessWidget {
  const MMCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MMC Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'HubotSans',
      ),
      home: const HomeScreen(),
    );
  }
}
