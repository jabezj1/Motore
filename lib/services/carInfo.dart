import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void fetchCarYear() async {
  print("fetchCarYear called");
  const url = 'http://api.carmd.com/v3.0/year';
  final uri = Uri.parse(url);
  final response = await http.get(
    uri,
    headers: {
      "content-type": "application/json",
      "authorization": "your_auth_key_here",
      "partner-token": "your_partner_token_here"
    },
  );
  final body = response.body;
  final json = jsonDecode(body);
}
