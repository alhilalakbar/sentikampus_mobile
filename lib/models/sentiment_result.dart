class SentimentResult {
  final String label;
  final double score;

  SentimentResult({
    required this.label,
    required this.score,
  });

  factory SentimentResult.fromJson(Map<String, dynamic> json) {
    return SentimentResult(
      label: json['label'] as String,
      score: (json['score'] as num).toDouble(),
    );
  }
}
