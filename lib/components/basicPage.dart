import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageName extends StatelessWidget {
  const PageName(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.lato(
          textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ));
  }
}

const List<String> list = <String>[
  ' Car One',
  ' Car Two',
  ' Car Three',
  ' Car Four',
];

String drop = list.first;

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black38, width: 3),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.only(left: 30, right: 30),
      child: DropdownButton<String>(
        value: drop,
        icon: const Icon(Icons.arrow_drop_down_sharp),
        elevation: 16,
        style: const TextStyle(color: Colors.blue),
        underline: Container(
          height: 1,
          width: 3,
          color: Colors.blueAccent,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            drop = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
