import 'package:flutter/material.dart';
import 'package:motore/services/auth.dart';
import 'package:motore/screens/authenticate/login.dart';

class pageName extends StatelessWidget {
  const pageName(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    );
  }
}

// class LoginComponents extends StatelessWidget {
//   const LoginComponents(
//       this.text, this.icons, this.error, this.setState, this.change, this.val);
//   final String text;
//   final dynamic icons;
//   final String error;
//   final Function setState;
//   dynamic change;
//   final dynamic val;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//         decoration: InputDecoration(
//           hintText: text,
//           fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
//           filled: true,
//           prefixIcon: Icon(icons),
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(18),
//               borderSide: BorderSide.none),
//         ),
//         validator: (String? val) {
//           if (val!.isEmpty) {
//             return error;
//           }
//           return null;
//         },
//         onChanged: (value) {
//           setState(() => change = val);
//         }
//         // onChanged: (val) {
//         //   setState(() => change = val);
//         // },
//         );

//     // TextFormField(
//     //   decoration: InputDecoration(
//     //     hintText: text,

//     //     border: OutlineInputBorder(
//     //         borderRadius: BorderRadius.circular(18),
//     //         borderSide: BorderSide.none),
//     //   ),
//     //   validator: (String? val) {
//     //     if (val!.isEmpty) {
//     //       return error;
//     //     }
//     //     return null;
//     //   },
//     //   obscureText: check,
//     // );
//   }
// }
