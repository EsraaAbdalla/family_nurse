import 'package:family_nurse/main.dart';
import 'package:flutter/material.dart';

class StartExam extends StatefulWidget {
  const StartExam(question, {super.key});

  @override
  State<StartExam> createState() => _StartExamState();
}

class _StartExamState extends State<StartExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(children: [
          Image.asset(
            'images/result.png',
            height: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              'Thanks you for playing the Quiz!',
              style: TextStyle(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('${Questions[0]['Question']}'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 5, top: 20),
                    child: Text(
                      '9',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Wrong Answers'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5, top: 20),
                    child: Text(
                      '27',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
 // Try Page...