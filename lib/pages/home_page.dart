import 'package:flutter/material.dart';

import '../services/sentiment_api.dart';
import '../models/sentiment_result.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  final SentimentApi api = SentimentApi();

  SentimentResult? result;
  String? errorMessage;
  bool isLoading = false;


  Future<void> analyzeComment() async {
    final text = controller.text.trim();

    if (text.length < 3) {
      setState(() {
        errorMessage = 'Masukkan minimal 3 karakter.';
        result = null;
      });
      return;
    }

    if (text.length > 500) {
      setState(() {
        errorMessage = 'Maksimal 500 karakter.';
        result = null;
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
      result = null;
    });

    try {
      final data = await api.predict(text);

      setState(() {
        result = data;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Gagal terhubung ke API.';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SentiKampus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Analisis Sentiment Komentar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: controller,
              maxLines: 5,
              maxLength: 500,
              decoration: const InputDecoration(
                hintText: 'Tulis komentar di sini...',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: isLoading ? null : analyzeComment,
              child: Text(
                isLoading ? 'Menganalisis...' : 'Analisis',
              ),
            ),

            const SizedBox(height: 24),

            if (isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),

            if (result != null) ...[
              Text(
                'Label: ${result!.label}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Score: ${result!.score}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],

            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
