// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:family_nurse/componenets_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var Data;
var Questions;

/////////////
Future questionsGroup() async {
  final jsonData = await rootBundle.loadString('assets/QuestionGroup.json');
  Data = jsonDecode(jsonData);
  // print(Data);
  return Data;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    // questionsGroup();
    //questions();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: questionsGroup(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const CallData();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
