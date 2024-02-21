import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchData(data) async {
  const String apiKey = "AIzaSyAVH3BntoRlSYH7VA35LByC71nE3SsmVTw";
  final Uri url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey');

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(data),
    );

    var res = json.decode(response.body);
    return {"code": 201, data: res.candidates[0].content.parts[0].text};
  } catch (e) {
    return {"code": 503, "error": e.toString()};
  }
}
