// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_credit_card/credit_card_model.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:motore/main.dart';

// class Credit_card extends StatelessWidget {
//   // const Credit_card({Key? key}) : super(key: key);

//   String cardNumber = '';
//   String cardHolderName = '';
//   String cvvNumber = '';
//   String expiryDate = '';
//   bool showBackView = false;

//   void onCreditcardModel(CreditCardModel creditCardModel) {
//     setState(() {
//       cardNumber = creditCardModel.cardNumber;
//       cardHolderName = creditCardModel.cardHolderName;
//       expiryDate = creditCardModel.expiryDate;
//       cvvNumber = creditCardModel.cvvCode;
//       showBackView = creditCardModel.isCvvFocused;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Add Card",
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             CreditCardWidget(
//               cardNumber: cardNumber,
//               expiryDate: expiryDate,
//               height: 210,
//               cardHolderName: cardHolderName,
//               cvvCode: cvvNumber,
//               showBackView: showBackView,
//               cardBgColor: Colors.greenAccent,
//               textStyle: TextStyle(
//                 color: Colors.black,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//               animationDuration: Duration(milliseconds: 1200),
//               onCreditCardWidgetChange: (CreditCardBrand) {},
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: CreditCardForm(
//                   onCreditCardModelChange: onCreditcardModel,
//                   cursorColor: Colors.red,
//                   themeColor: Colors.black,
//                   cardHolderName: cardHolderName,
//                   cardNumber: cardNumber,
//                   cvvCode: cvvNumber,
//                   expiryDate: expiryDate,
//                   formKey: GlobalKey<FormState>(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void setState(Null Function() param0) {}

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       backgroundColor: Colors.white,
  //       appBar: AppBar(title: Text("New Card")),
  //       body: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           children: [
  //             Form(
  //                 child: Column(
  //               children: [
  //                 TextFormField(
  //                   keyboardType: TextInputType.number,
  //                   inputFormatters: [
  //                     FilteringTextInputFormatter.digitsOnly,
  //                     LengthLimitingTextInputFormatter(19),
  //                     CardNumberInputFormatter(),
  //                   ],
  //                   decoration: InputDecoration(
  //                       hintText: "Card Number",
  //                       prefixIcon: Padding(
  //                         padding: const EdgeInsets.symmetric(vertical: 10),
  //                         child: ImageIcon(
  //                             AssetImage("lib/icons/credit-card.png")),
  //                       )),
  //                 )
  //               ],
  //             ))
  //           ],
  //         ),
  //       ));
  // }
// }

// class CardNumberInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     if (newValue.selection.baseOffset == 0) {
//       return newValue;
//     }

//     String inputData = newValue.text;
//     StringBuffer buffer = StringBuffer();

//     for (var i = 0; i < inputData.length; i++) {
//       buffer.write(inputData[i]);
//       int index = i + 1;

//       if (index % 4 == 0 && inputData.length != index) {
//         buffer.write(" ");
//       }
//     }

//     return TextEditingValue(
//       text: buffer.toString(),
//       selection: TextSelection.collapsed(
//         offset: buffer.toString().length,
//       ),
//     );
//   }
// }
