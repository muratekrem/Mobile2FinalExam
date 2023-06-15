import 'dart:convert';

import 'package:http/http.dart' as http;

class VocabularyWord {
  final String word;
  final String translation;
  final String exampleSentence;

  VocabularyWord({
    required this.word,
    required this.translation,
    required this.exampleSentence,
  });
}

class VocabularyService {
  static const String apiUrl = 'https://api.example.com/vocabulary';

  Future<List<VocabularyWord>> fetchVocabularyData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<VocabularyWord> vocabularyWords = [];

        for (var item in data) {
          VocabularyWord vocabularyWord = VocabularyWord(
            word: item['word'],
            translation: item['translation'],
            exampleSentence: item['exampleSentence'],
          );
          vocabularyWords.add(vocabularyWord);
        }

        return vocabularyWords;
      } else {
        throw Exception('Failed to fetch vocabulary data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
