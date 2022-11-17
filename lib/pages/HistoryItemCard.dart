import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motore/pages/HistoryItem.dart';

class HistoryItemCard extends StatelessWidget {
  final HistoryItem _historyItem;
  const HistoryItemCard(this._historyItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
        ),
        // color: Colors.black,
        child: Card(
          margin: const EdgeInsets.all(5),
          elevation: 0,
          child: Container(
            clipBehavior: Clip.hardEdge,

            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color(0xff15aaaff),
                  Color(0xFFADF7F2),
                ]),
                // color: Colors.blue[100],
                borderRadius: BorderRadius.circular(30.0)),
            //height: 200,
            //   color: Color.fromARGB(255, 251, 240, 240),
            child: Container(
              // margin: const EdgeInsets.all(30),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment
                        // .spaceBetween, // forces children in row to split left & right
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text(
                                        _historyItem.title!
                                            .toUpperCase()
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ) // title of maintenance
                                      ),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        _historyItem.notes.toString(),
                                        //   textAlign: TextAlign.left,
                                      ),
                                    ) // notes that go under the title
                                    ),
                                Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "LOCATION: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(_historyItem.location.toString())
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "\$",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        _historyItem.cost.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ), // cost of the maintenance, far right side
                                    ],
                                  )),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
