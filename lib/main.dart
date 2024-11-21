// Multi provider main widget
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider_from_course/multi_provider.dart';

// void main() {
//   runApp(MultiProvider(
//     providers: [
//       StreamProvider.value(
//           value: Stream<Seconds>.periodic(
//             const Duration(seconds: 1),
//             (_) => Seconds(),
//           ),
//           initialData: Seconds()),
//       StreamProvider.value(
//           value: Stream<Minutes>.periodic(
//             const Duration(minutes: 1),
//             (_) => Minutes(),
//           ),
//           initialData: Minutes())
//     ],
//     child: const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     ),
//   ));
// }

// Bread crumb main widget..
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider_from_course/bread_crumb_example.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => BreadCrumbExample(),
//       child: MaterialApp(
//         home: MainScreen(),
//         routes: {
//           '/new': (context) => AddBreadCrumb(),
//         },
//       ),
//     ),
//   );
// }

// Cheap widget and expensive widget example code's main
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_from_course/cheap_and_expensive_object.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ObjectProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    ),
  );
}
