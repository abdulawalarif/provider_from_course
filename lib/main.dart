import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_from_course/bread_crumb_example.dart';
import 'package:provider_from_course/cheap_and_expensive_object.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ObjectProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
         
      ),
    ),
  );
}
