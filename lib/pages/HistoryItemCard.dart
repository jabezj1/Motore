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
    return Container(
      color: Colors.black,
      child: Card(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          height: 200,
          //   color: Color.fromARGB(255, 251, 240, 240),
          child: Container(
            child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // forces children in row to split left & right
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(_historyItem.title!
                                      .toUpperCase()
                                      .toString()) // title of maintenance
                                  ),
                              Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    _historyItem.notes.toString(),
                                    textAlign: TextAlign.left,
                                  ) // notes that go under the title
                                  ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    const Text("LOCATION: "),
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
                                    const Text("\$"),
                                    Text(_historyItem.cost
                                        .toString()), // cost of the maintenance, far right side
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
    );
  }
}
