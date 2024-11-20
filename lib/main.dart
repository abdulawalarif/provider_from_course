import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_from_course/bread_crumb_example.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BreadCrumbExample(),
      child: MaterialApp(
        home: MainScreen(),
        routes: {
          '/new': (context) => AddBreadCrumb(),
        },
      ),
    ),
  );
}
