// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:family_nurse/page_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CallData extends StatefulWidget {
  const CallData({super.key});

  @override
  State<CallData> createState() => _CallDataState();
}

class _CallDataState extends State<CallData> {
  var Data;

/////////////
  void questionsGroup() async {
    final jsonData = await rootBundle.loadString('assets/QuestionGroup.json');
    Data = jsonDecode(jsonData);
    if (Data.runtimeType == List<dynamic>) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PageOne()),
      );
    } else {}
    // print(Data.runtimeType);
  }

  @override
  void initState() {
    super.initState();
    questionsGroup();
    //questions(1);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
