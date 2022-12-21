import 'package:flutter/material.dart';
import 'package:motore/pages/ExpenseItem.dart';

class ExpenseItemCard extends StatelessWidget {
  final ExpenseItem _expenseItem;
  const ExpenseItemCard(this._expenseItem, {super.key});

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
                                      child: Row(
                                        children: [
											Flexible(
												child: Text(
													_expenseItem.title!,
													style: const TextStyle(
														color: Colors.black,
														fontSize: 20,
														fontWeight: FontWeight.bold
													),
												),
											),	
                                        ],
                                      ) // title of maintenance
                                      ),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
											const Text(
												"Date: ",
												style: TextStyle(
													color: Colors.black,
													fontSize: 17.5,
													fontWeight: FontWeight.normal
												),
											),
                                          Flexible(
											child: Text(
											  _expenseItem.timestamp!.toDate().toString(),
																					style: const TextStyle(
																						fontSize: 17.5,
																						color: Colors.black,
																						fontWeight: FontWeight.normal
																					),
											  //   textAlign: TextAlign.left,
											),
										  ),
                                        ],
                                      ),
                                    ) // notes that go under the title
                                    ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 50, 172, 228),
                                        border: Border.all(
                                          color: Colors.red.shade400,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Row(
                                      children: [
                                        Text(
                                          "\$",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          _expenseItem.cost.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ), // cost of the maintenance, far right side
                                      ],
                                    ),
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
