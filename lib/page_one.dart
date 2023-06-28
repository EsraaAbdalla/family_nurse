// ignore_for_file: unnecessary_brace_in_string_interps, use_build_context_synchronously, avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:family_nurse/main.dart';
import 'package:family_nurse/widgets/start_page.dart';
import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 70.0),
          child: Text(
            "Groups",
            style: TextStyle(fontSize: 25.0, color: Colors.black),
          ),
        ),
      ),
      body: ReorderableListView.builder(
        itemBuilder: (context, index) {
          return Card(
              key: Key('${index}'),
              child: ListTile(
                tileColor: Colors.grey[300],
                title: Text(Data[index]['GroupName']),
                trailing: IconButton(
                    onPressed: () {
                      // loadJsonData();
                      //   loadJsonData();
                      // await loadJsonData(Data[index]['ID']);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartPage(
                                    q: Data[index]['ID'],
                                  )));
                    },
                    icon: const Icon(Icons.arrow_circle_right_outlined)),
              ));
        },
        onReorder: (int oldIndex, int newIndex) {
          // your reorder logic here
        },
        itemCount: Data == null ? 0 : Data.length,
      ),
    );
  }
}


//  onReorder: ((int oldIndex, int newIndex) {
//             setState(() {
//               // if (newIndex > oldIndex) {
//               //   newIndex -= 1;
//               // }
//               // final int tmp = Data[oldIndex];
//               // Data.removeAt(oldIndex);
//               // Data.insert(newIndex, tmp);
//             });
//           }
//           )
