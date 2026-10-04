import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/sentiment_result.dart';


class SentimentApi {
  static const String baseUrl = 'http://192.168.1.6:8000';

  Future<SentimentResult> predict(String text) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/predict'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'text': text,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return SentimentResult.fromJson(data);
    }

    throw Exception(
      'Gagal memproses sentiment. Status code: ${response.statusCode}',
    );
  }
}
