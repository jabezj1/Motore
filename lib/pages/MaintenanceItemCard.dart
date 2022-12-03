import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motore/pages/MaintenanceItem.dart';

class MaintenanceItemCard extends StatelessWidget {
  final MaintenanceItem _maintenance;

  MaintenanceItemCard(this._maintenance);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            // color: Colors.pink,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          _maintenance.system.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Miles remaining:"),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                border: Border.all(
                                  color: Colors.red.shade400,
                                  width: 3,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              _maintenance.miles.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
