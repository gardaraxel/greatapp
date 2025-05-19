import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() => runApp(TimaSkraning());

class TimaSkraning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TímaSkráning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red, useMaterial3: true),
      home: MyCoolTimingApp(),
    );
  }
}
