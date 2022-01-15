import 'package:datamodel/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DynamicData());
}
class DynamicData extends StatelessWidget {
  const DynamicData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      );
  
  }
} 