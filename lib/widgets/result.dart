import 'package:family_nurse/componenets_page.dart';
import 'package:family_nurse/main.dart';
import 'package:family_nurse/page_one.dart';
import 'package:family_nurse/widgets/custom_button.dart';
import 'package:family_nurse/widgets/start_page.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

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
              'Thank you for playing the Quiz!',
              style: TextStyle(),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blue[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 15),
                    child: Text(
                      'Correct Answers',
                      style: TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 20),
                    child: Text(
                      '$GreenResult',
                      style: const TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.red[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 15),
                    child: Text(
                      'Wrong Answers',
                      style: TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 20),
                    child: Text(
                      '${filteredItems.length - GreenResult}',
                      style: const TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Restart Quiz',
            color: Colors.purple,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
            },
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            color: Colors.white,
            text: 'Select Another Quiz',
            textColor: Colors.grey,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
            },
          ),
        ]),
      ),
    );
  }
}
