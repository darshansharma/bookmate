import 'package:autogpt/components/bookmate/bookmate.component.dart';
import 'package:autogpt/components/bookmate/bookmate.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<BookMate>(
      create: (context) => BookMate(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'bookmate',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          primaryColor: const Color.fromRGBO(234, 235, 239, 1),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          ),
        ),
        home: const Bookmate());
  }
}
