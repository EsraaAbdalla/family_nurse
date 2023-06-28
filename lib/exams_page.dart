import 'package:flutter/material.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const Text(
              'Groups',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(color: Colors.grey[300]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      " Start Exam 1",
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    const SizedBox(
                      width: 150.0,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_circle_right_outlined))
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
