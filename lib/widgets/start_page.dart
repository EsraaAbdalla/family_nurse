// ignore_for_file: prefer_typing_uninitialized_variables, unused_element, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:family_nurse/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var qID;
var jsonData;
var listGlobal;
var filteredItems;
bool _isClicked = false;
var CorrectAns;

var i = 0;
int special() {
  i++;
  return i;
}

var number = 1;
int changeNumber() {
  number++;
  return number;
}

Future loadJsonData(sms) async {
  final jsonData = await rootBundle.loadString('assets/Questions.json');
  listGlobal = jsonDecode(jsonData);
  //print(listGlobal);
  print(sms);
  filteredItems = listGlobal.where((item) => item['GroupId'] == sms).toList();
  print(filteredItems);
  CorrectAns = filteredItems[i]['Answer'];
  print(CorrectAns);
  return filteredItems;
}

class StartPage extends StatefulWidget {
  const StartPage({super.key, this.q});
  final q;
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String? _selectedChoice;
  bool _isAnswered = false;

  void _onChoiceSelected(String choice) {
    setState(() {
      _selectedChoice = choice;
      _isAnswered = true;
    });
  }

  @override
  void initState() {
    qID = widget.q;

    print(qID);
    loadJsonData(qID);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xfff1f5fd),
      body: FutureBuilder(
        future: loadJsonData(qID),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List filteredItems = snapshot.data!;
            return ListView(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.purple,
                        )),
                    SizedBox(
                      width: screenWidth * 0.25,
                    ),
                    Center(
                      child: Text(
                        'START EXAM $qID',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Question $number/${filteredItems.length}',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 95, 94, 94),
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: Text(
                    '${filteredItems[i]['Question']}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Choose(
                  Conwidth: screenWidth * 0.09,
                  text: '${filteredItems[i]['OptA']}',
                  id: 'A',
                  width: screenWidth * 0.8,
                  isDisabled: _isAnswered,
                  onChanged: (selected) {
                    if (selected.isNotEmpty) {
                      _onChoiceSelected('A');
                    } else {
                      _onChoiceSelected('');
                    }
                  },
                  isSelected: _selectedChoice == 'A',
                ),
                const SizedBox(
                  height: 15,
                ),
                Choose(
                  isDisabled: _isAnswered,
                  isSelected: _selectedChoice == 'B',
                  onChanged: (selected) {
                    if (selected.isNotEmpty) {
                      _onChoiceSelected('B');
                    } else {
                      _onChoiceSelected('');
                    }
                  },
                  Conwidth: screenWidth * 0.09,
                  text: '${filteredItems[i]['OptB']}',
                  id: 'B',
                  width: screenWidth * 0.8,
                ),
                const SizedBox(
                  height: 15,
                ),
                Choose(
                  isDisabled: _isAnswered,
                  isSelected: _selectedChoice == 'C',
                  onChanged: (selected) {
                    if (selected.isNotEmpty) {
                      _onChoiceSelected('C');
                    } else {
                      _onChoiceSelected('');
                    }
                  },
                  Conwidth: screenWidth * 0.09,
                  text: '${filteredItems[i]['OptC']}',
                  id: 'C',
                  width: screenWidth * 0.8,
                ),
                const SizedBox(
                  height: 15,
                ),
                Choose(
                  Conwidth: screenWidth * 0.09,
                  text: '${filteredItems[i]['OptD']}',
                  id: 'D',
                  width: screenWidth * 0.8,
                  isDisabled: _isAnswered,
                  isSelected: _selectedChoice == 'D',
                  onChanged: (selected) {
                    if (selected.isNotEmpty) {
                      _onChoiceSelected('D');
                    } else {
                      _onChoiceSelected('');
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  onTap: () {
                    special();
                    changeNumber();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StartPage(q: qID)));
                  },
                  color: Colors.purple,
                  text: 'Next',
                  textColor: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Explanation',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05, top: 10),
                  child: Text(
                    '${filteredItems[i]['Explanation']}   ',
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class Choose extends StatefulWidget {
  const Choose({
    super.key,
    required this.text,
    required this.id,
    required this.width,
    required this.Conwidth,
    required this.onChanged,
    required this.isSelected,
    required this.isDisabled,
  });
  final String text;
  final String id;
  final double width;
  final double Conwidth;
  final ValueChanged<String> onChanged;
  final bool isSelected;
  final bool isDisabled;

  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  bool _isSelected = false;

  var isCorrect;
  @override
  void initState() {
    _isSelected = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: widget.isDisabled
            ? null
            : () {
                setState(() {
                  print("false");

                  _isSelected = !_isSelected;
                });
                widget.onChanged(_isSelected ? widget.id : '');
                print(widget.id);

                if (widget.id == CorrectAns) {
                  isCorrect = true;
                } else {
                  isCorrect = false;
                }
              },
        child: Container(
          height: 50,
          width: widget.Conwidth,
          decoration: BoxDecoration(
              border: Border.all(
            color: _isSelected
                ? (isCorrect ? Colors.green : Colors.red)
                : Colors.white,
          )),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  width: widget.width,
                  child: Text(
                    widget.text,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
