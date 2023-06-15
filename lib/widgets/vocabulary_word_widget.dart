import 'package:flutter/material.dart';

class VocabularyWordWidget extends StatelessWidget {
  final String word;
  final String translation;
  final String exampleSentence;
  final bool showExampleSentence;

  VocabularyWordWidget({
    required this.word,
    required this.translation,
    required this.exampleSentence,
    required this.showExampleSentence,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          word,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          translation,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 16.0),
        if (showExampleSentence)
          Text(
            exampleSentence,
            style: TextStyle(fontSize: 16),
          ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
