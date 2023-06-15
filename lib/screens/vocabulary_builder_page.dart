import 'package:flutter/material.dart';
import 'dart:math';
import '../services/vocabulary_service.dart';


class VocabularyWord {
  final String word;
  final String translation;
  final String exampleSentence;
  final String image;

  VocabularyWord({
    required this.word,
    required this.translation,
    required this.exampleSentence,
    required this.image,
  });
}

class VocabularyBuilderPage extends StatefulWidget {
  @override
  _VocabularyBuilderPageState createState() => _VocabularyBuilderPageState();
}

class _VocabularyBuilderPageState extends State<VocabularyBuilderPage> {
  List<VocabularyWord> vocabularyWords = [
    VocabularyWord(
        word: 'Apple',
        translation: 'Elma',
        exampleSentence: 'I eat an apple.',
        image: 'assets/fruits/apple.jpg'
    ),
    VocabularyWord(
        word: 'Banana',
        translation: 'Muz',
        exampleSentence: 'I like banana.',
        image: 'assets/fruits/banana.jpeg'
    ),
    VocabularyWord(
        word: 'Meeting Friends',
        translation: 'Arkadaşlarla buluşma',
        exampleSentence: 'I enjoy meeting friends.',
        image: 'assets/social/friends.jpg'
    ),
    VocabularyWord(
        word: 'Going to a Party',
        translation: 'Partiye gitmek',
        exampleSentence: 'I had a great time going to a party.',
        image: 'assets/social/party.jpeg'
    ),
    VocabularyWord(
        word: 'Chair',
        translation: 'Sandalye',
        exampleSentence: 'I sit on a chair.',
        image: 'assets/house/chair.jpeg'
    ),
    VocabularyWord(
        word: 'Table',
        translation: 'Masa',
        exampleSentence: 'I put my books on the table.',
        image: 'assets/house/table.jpeg'
    ),
    VocabularyWord(
        word: 'Mother',
        translation: 'Anne',
        exampleSentence: 'I went to the beach with my mother.',
        image: 'assets/family/mother.jpeg'
    ),
    VocabularyWord(
        word: 'Brother',
        translation: 'Erkek kardeş',
        exampleSentence: 'I trust on my brother.',
        image: 'assets/family/brother.jpeg'
    ),
  ];

  @override
  void initState() {
    super.initState();
    fetchVocabularyData();
  }

  Future<void> fetchVocabularyData() async {
    try {
      final service = VocabularyService();
      final List<VocabularyWord> fetchedData = (await service.fetchVocabularyData()).cast<VocabularyWord>();

      setState(() {
        vocabularyWords = fetchedData;
      });

      generateChoices();
    } catch (e) {
      // Handle the error accordingly
    }
  }
  int currentIndex = 0;
  bool showExampleSentence = false;
  bool showQuiz = false;
  bool isAnswered = false;
  int correctAnswerIndex = 0;
  List<String> choices = [];
  List<bool> answerStatus = [false, false];

  void generateChoices() {
    choices.clear();
    choices.add(vocabularyWords[currentIndex].word);
    choices.add(getRandomWord() );
    choices.shuffle();
    correctAnswerIndex = choices.indexOf(vocabularyWords[currentIndex].word);
  }

  String getRandomWord() {
    Random random = Random();
    int randomIndex = random.nextInt(vocabularyWords.length);
    return vocabularyWords[randomIndex].word;
  }

  String getQuizSentence() {
    return vocabularyWords[currentIndex].exampleSentence.replaceAll(
      vocabularyWords[currentIndex].word,
      '______',
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vocabulary Builder'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (vocabularyWords.isEmpty)
              Text('Loading vocabulary words...'),
            if (vocabularyWords.isNotEmpty)
              Expanded(
                child: Column(
                  children: [
                    Text(
                      showExampleSentence
                          ? vocabularyWords[currentIndex].exampleSentence
                          : vocabularyWords[currentIndex].word,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      vocabularyWords[currentIndex].translation,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16.0),
                    Image.asset(
                      vocabularyWords[currentIndex].image,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),

            if (showQuiz && !isAnswered)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Fill in the blank:',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      getQuizSentence(),
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isAnswered = true;
                              answerStatus[0] = true;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<
                                Color>((states) {
                              if (answerStatus[0] && correctAnswerIndex == 0) {
                                return Colors.green;
                              } else if (answerStatus[0] &&
                                  correctAnswerIndex != 0) {
                                return Colors.red;
                              } else {
                                return Colors.blue;
                              }
                            }),
                          ),
                          child: Text(choices[0]),
                        ),
                        SizedBox(width: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isAnswered = true;
                              answerStatus[1] = true;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<
                                Color>((states) {
                              if (answerStatus[1] && correctAnswerIndex == 1) {
                                return Colors.green;
                              } else if (answerStatus[1] &&
                                  correctAnswerIndex != 1) {
                                return Colors.red;
                              } else {
                                return Colors.blue;
                              }
                            }),
                          ),
                          child: Text(choices[1]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (isAnswered)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      answerStatus[correctAnswerIndex]
                          ? 'Correct!'
                          : 'Incorrect!',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isAnswered = false;
                          showQuiz = false;
                          showExampleSentence = false;
                          currentIndex = (currentIndex + 1) %
                              vocabularyWords.length;
                          generateChoices();
                          answerStatus = [false, false];
                        });
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentIndex > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentIndex--;
                        showExampleSentence = false;
                        showQuiz = false;
                        isAnswered = false;
                        generateChoices();
                        answerStatus = [false, false];
                      });
                    },
                    child: Text('Previous'),
                  ),
                if (currentIndex < vocabularyWords.length - 1 && !showQuiz)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentIndex++;
                        showExampleSentence = false;
                        showQuiz = false;
                        isAnswered = false;
                        generateChoices();
                        answerStatus = [false, false];
                      });
                    },
                    child: Text('Next'),
                  ),
                if (!showQuiz)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showExampleSentence = !showExampleSentence;
                      });
                    },
                    child: Text(
                      showExampleSentence ? 'Hide Example' : 'Show Example',
                    ),
                  ),
                if (!showExampleSentence && !showQuiz)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showQuiz = true;
                        generateChoices();
                        answerStatus = [false, false];
                      });
                    },
                    child: Text('Start Quiz'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


