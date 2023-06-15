import 'package:flutter/material.dart';
import 'screens/vocabulary_builder_page.dart';
import 'widgets/vocabulary_word_widget.dart';

void main() {
  runApp(MaterialApp(
    home: LanguageBuddyHomePage(),
  ));
}
class LearningLanguagesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Languages',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LanguageBuddyHomePage(),
    );
  }
}

class LanguageBuddyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Languages'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Learning Languages!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to language selection screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LanguageSelectionScreen()),
                );
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Target Language'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('English'),
            onTap: () {
              // Language selected, navigate to questions screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionsScreen(language: 'English')),
              );
            },
          ),
          ListTile(
            title: Text('Spanish'),
            onTap: () {
              // Language selected, navigate to questions screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionsScreen(language: 'Spanish')),
              );
            },
          ),
          ListTile(
            title: Text('Italian'),
            onTap: () {
              // Language selected, navigate to questions screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionsScreen(language: 'Italian')),
              );
            },
          ),
          ListTile(
            title: Text('Japanese'),
            onTap: () {
              // Language selected, navigate to questions screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionsScreen(language: 'Japanese')),
              );
            },
          ),
          ListTile(
            title: Text('French'),
            onTap: () {
              // Language selected, navigate to questions screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionsScreen(language: 'French')),
              );
            },
          ),
          // Add more language options here...
        ],
      ),
    );
  }
}

class QuestionsScreen extends StatelessWidget {
  final String language;

  QuestionsScreen({required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Languages'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have chosen $language',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Here are some questions to get started:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text('Question 1: How do you say "hello" in $language?'),
            Text('Question 2: What is a common greeting in $language?'),
            Text('Question 3: How do you say "thank you" in $language?'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to alphabet screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlphabetScreen(language: language)),
                );
              },
              child: Text('Alphabet'),
            ),
          ],
        ),
      ),
    );
  }
}

class AlphabetScreen extends StatelessWidget {
  final String language;

  AlphabetScreen({required this.language});

  @override
  Widget build(BuildContext context) {
    List<String> alphabets = getAlphabets(language);

    return Scaffold(
      appBar: AppBar(
        title: Text('Alphabets'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: alphabets.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(alphabets[index]),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to learning options screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LearningOptionsScreen(language: language)),
              );
            },
            child: Text('Let\'s Start Learning $language'),
          ),
        ],
      ),
    );
  }

  List<String> getAlphabets(String language) {
    List<String> alphabets = [];

    switch (language) {
      case 'English':
        alphabets = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
        break;
      case 'Spanish':
        alphabets = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'Ñ', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
        break;
      case 'Italian':
        alphabets = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'Z'];
        break;
      case 'Japanese':
        alphabets = ['あ', 'い', 'う', 'え', 'お', 'か', 'き', 'く', 'け', 'こ', 'さ', 'し', 'す', 'せ', 'そ', 'た', 'ち', 'つ', 'て', 'と', 'な', 'に', 'ぬ', 'ね', 'の', 'は', 'ひ', 'ふ', 'へ', 'ほ', 'ま', 'み', 'む', 'め', 'も', 'や', 'ゆ', 'よ', 'ら', 'り', 'る', 'れ', 'ろ', 'わ', 'を', 'ん'];
        break;
      case 'French':
        alphabets = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
        break;
    }

    return alphabets;
  }
}


class LearningOptionsScreen extends StatelessWidget {
  final String language;

  LearningOptionsScreen({required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Options'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the specific learning screen (e.g., fruits)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearningScreen(language: language, topic: 'Fruits')),
                );
              },
              child: Text('Fruits'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the specific learning screen (e.g., social)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearningScreen(language: language, topic: 'Social')),
                );
              },
              child: Text('Social'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the specific learning screen (e.g., house)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearningScreen(language: language, topic: 'House')),
                );
              },
              child: Text('House'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the specific learning screen (e.g., family)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearningScreen(language: language, topic: 'Family')),
                );
              },
              child: Text('Family'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the specific learning screen (e.g., dish)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearningScreen(language: language, topic: 'Dish')),
                );
              },
              child: Text('Dish'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the specific learning screen (e.g., dish)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearningScreen(language: language, topic: 'Jobs')),
                );
              },
              child: Text('Jobs'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the specific learning screen (e.g., dish)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearningScreen(language: language, topic: 'Weather')),
                );
              },
              child: Text('Weather'),
            ),
          ],
        ),
      ),
    );
  }
}

class LearningScreen extends StatelessWidget {
  final String language;
  final String topic;

  LearningScreen({required this.language, required this.topic});

  List<LearningContent> getLearningContent(String topic) {
    List<LearningContent> content = [];

    switch (topic) {
      case 'Fruits':
        content = getFruits(language);
        break;
      case 'Social':
        content = getSocialActivities(language);
        break;
      case 'House':
        content = getHouseItems(language);
        break;
      case 'Family':
        content = getFamilyMembers(language);
        break;
      case 'Dish':
        content = getDishes(language);
        break;
      case 'Jobs':
        content = getJobs(language);
        break;
      case 'Weather':
        content = getWeather(language);
    }

    return content;
  }

  @override
  Widget build(BuildContext context) {
    List<LearningContent> learningContent = getLearningContent(topic);

    return Scaffold(
      appBar: AppBar(
        title: Text('$topic in $language'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: learningContent.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    learningContent[index].image,
                    width: 48,
                    height: 48,
                  ),
                  title: Text(learningContent[index].name),
                  subtitle: Text(learningContent[index].description),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to VocabularyBuilderPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VocabularyBuilderPage(),
                ),
              );
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }



  List<LearningContent> getFruits(String language) {
    List<LearningContent> fruits = [];

    switch (language) {
      case 'English':
        fruits = [
          LearningContent(
            name: 'Apple',
            description: 'A round fruit with a red or green skin and firm white flesh.',
            image: 'assets/fruits/apple.jpg',
          ),
          LearningContent(
            name: 'Banana',
            description: 'A long curved fruit with a yellow skin and soft sweet flesh.',
            image: 'assets/fruits/banana.jpeg',
          ),
          LearningContent(
            name: 'Orange',
            description: 'A citrus fruit with a bright orange skin and juicy segments.',
            image: 'assets/fruits/orange.jpeg',
          ),
          LearningContent(
            name: 'Grapes',
            description: 'Small juicy fruits that grow in clusters on vines.',
            image: 'assets/fruits/grapes.jpeg',
          ),
          LearningContent(
            name: 'Strawberry',
            description: 'A small sweet fruit with a red skin and seeds on the surface.',
            image: 'assets/fruits/strawberry.jpg',
          ),
          LearningContent(
            name: 'Watermelon',
            description: 'A large juicy fruit with a green rind and red or pink flesh.',
            image: 'assets/fruits/watermelon.jpeg',
          ),
          LearningContent(
            name: 'Pineapple',
            description: 'A tropical fruit with a rough brown skin and sweet yellow flesh.',
            image: 'assets/fruits/pineapple.jpeg',
          ),
          LearningContent(
            name: 'Mango',
            description: 'A tropical fruit with a yellow or orange skin and juicy flesh.',
            image: 'assets/fruits/mango.jpeg',
          ),
          LearningContent(
            name: 'Kiwi',
            description: 'A small fruit with a brown hairy skin and green flesh.',
            image: 'assets/fruits/kiwi.jpeg',
          ),
          LearningContent(
            name: 'Peach',
            description: 'A soft fruit with fuzzy skin and juicy sweet flesh.',
            image: 'assets/fruits/peach.jpeg',
          ),
        ];

        break;
      case 'Spanish':
        fruits = [
          LearningContent(
            name: 'Manzana',
            description: 'Una fruta redonda con piel roja o verde y carne blanca firme.',
            image: 'assets/fruits/apple.jpg',
          ),
          LearningContent(
            name: 'Plátano',
            description: 'Una fruta larga y curva con piel amarilla y carne dulce y suave.',
            image: 'assets/fruits/banana.jpeg',
          ),
          LearningContent(
            name: 'Naranja',
            description: 'Una fruta cítrica con piel naranja brillante y segmentos jugosos.',
            image: 'assets/fruits/orange.jpeg',
          ),
          LearningContent(
            name: 'Uvas',
            description: 'Pequeñas frutas jugosas que crecen en racimos en las vides.',
            image: 'assets/fruits/grapes.jpeg',
          ),
          LearningContent(
            name: 'Fresa',
            description: 'Una fruta pequeña y dulce con piel roja y semillas en la superficie.',
            image: 'assets/fruits/strawberry.jpg',
          ),
          LearningContent(
            name: 'Sandía',
            description: 'Una fruta grande y jugosa con cáscara verde y pulpa roja o rosada.',
            image: 'assets/fruits/watermelon.jpeg',
          ),
          LearningContent(
            name: 'Piña',
            description: 'Una fruta tropical con cáscara rugosa de color marrón y pulpa amarilla dulce.',
            image: 'assets/fruits/pineapple.jpeg',
          ),
          LearningContent(
            name: 'Mango',
            description: 'Una fruta tropical con piel amarilla o naranja y pulpa jugosa.',
            image: 'assets/fruits/mango.jpeg',
          ),
          LearningContent(
            name: 'Kiwi',
            description: 'Una fruta pequeña con piel marrón peluda y pulpa verde.',
            image: 'assets/fruits/kiwi.jpeg',
          ),
          LearningContent(
            name: 'Durazno',
            description: 'Una fruta suave con piel peluda y pulpa jugosa y dulce.',
            image: 'assets/fruits/peach.jpeg',
          ),
        ];

        break;
      case 'Italian':
        fruits = [
          LearningContent(
            name: 'Mela',
            description: 'Un frutto rotondo con la buccia rossa o verde e la polpa bianca e soda.',
            image: 'assets/fruits/apple.jpg',
          ),
          LearningContent(
            name: 'Banana',
            description: 'Un frutto lungo e curvo con la buccia gialla e la polpa dolce e morbida.',
            image: 'assets/fruits/banana.jpeg',
          ),
          LearningContent(
            name: 'Arancia',
            description: 'Un frutto agrumato con buccia arancione brillante e segmenti succosi.',
            image: 'assets/fruits/orange.jpeg',
          ),
          LearningContent(
            name: 'Uva',
            description: 'Piccoli frutti succosi che crescono in grappoli sulle viti.',
            image: 'assets/fruits/grapes.jpeg',
          ),
          LearningContent(
            name: 'Fragola',
            description: 'Un piccolo frutto dolce con la buccia rossa e semi sulla superficie.',
            image: 'assets/fruits/strawberry.jpg',
          ),
          LearningContent(
            name: 'Anguria',
            description: 'Un grosso frutto succoso con buccia verde e polpa rossa o rosa.',
            image: 'assets/fruits/watermelon.jpeg',
          ),
          LearningContent(
            name: 'Ananas',
            description: 'Un frutto tropicale con buccia ruvida di colore marrone e polpa gialla dolce.',
            image: 'assets/fruits/pineapple.jpeg',
          ),
          LearningContent(
            name: 'Mango',
            description: 'Un frutto tropicale con la buccia gialla o arancione e la polpa succosa.',
            image: 'assets/fruits/mango.jpeg',
          ),
          LearningContent(
            name: 'Kiwi',
            description: 'Un piccolo frutto con la buccia marrone pelosa e la polpa verde.',
            image: 'assets/fruits/kiwi.jpeg',
          ),
          LearningContent(
            name: 'Pesca',
            description: 'Un frutto morbido con la buccia pelosa e la polpa succosa e dolce.',
            image: 'assets/fruits/peach.jpeg',
          ),
        ];

        break;
      case 'Japanese':
        fruits = [
          LearningContent(
            name: 'りんご',
            description: '赤や緑の皮と白い固い果肉を持つ丸い果物。',
            image: 'assets/fruits/apple.jpg',
          ),
          LearningContent(
            name: 'バナナ',
            description: '黄色い皮と柔らかく甘い果肉を持つ長い曲がった果物。',
            image: 'assets/fruits/banana.jpeg',
          ),
          LearningContent(
            name: 'オレンジ',
            description: '鮮やかなオレンジ色の皮とジューシーなセグメントを持つ柑橘系の果物。',
            image: 'assets/fruits/orange.jpeg',
          ),
          LearningContent(
            name: 'ぶどう',
            description: '蔓に房状に実る小さなジューシーな果実。',
            image: 'assets/fruits/grapes.jpeg',
          ),
          LearningContent(
            name: 'いちご',
            description: '赤い皮と表面に種がある小さな甘い果物。',
            image: 'assets/fruits/strawberry.jpg',
          ),
          LearningContent(
            name: 'すいか',
            description: '緑色の皮と赤またはピンクの果肉を持つ大きなジューシーな果物。',
            image: 'assets/fruits/watermelon.jpeg',
          ),
          LearningContent(
            name: 'パイナップル',
            description: '茶色のザラザラした皮と甘い黄色の果肉を持つ熱帯果実。',
            image: 'assets/fruits/pineapple.jpeg',
          ),
          LearningContent(
            name: 'マンゴー',
            description: '黄色またはオレンジの皮とジューシーな果肉を持つ熱帯果実。',
            image: 'assets/fruits/mango.jpeg',
          ),
          LearningContent(
            name: 'キウイ',
            description: '茶色の毛むくじゃらの皮と緑色の果肉を持つ小さな果物。',
            image: 'assets/fruits/kiwi.jpeg',
          ),
          LearningContent(
            name: 'もも',
            description: 'ふわふわした皮とジューシーで甘い果肉を持つ柔らかい果物。',
            image: 'assets/fruits/peach.jpeg',
          ),
        ];


        break;
      case 'French':
        fruits = [
          LearningContent(
            name: 'Pomme',
            description: 'Un fruit rond avec une peau rouge ou verte et une chair blanche ferme.',
            image: 'assets/fruits/apple.jpg',
          ),
          LearningContent(
            name: 'Banane',
            description: 'Un fruit long et courbé avec une peau jaune et une chair douce et tendre.',
            image: 'assets/fruits/banana.jpeg',
          ),
          LearningContent(
            name: 'Orange',
            description: 'Un agrume avec une peau orange vif et des segments juteux.',
            image: 'assets/fruits/orange.jpeg',
          ),
          LearningContent(
            name: 'Raisin',
            description: 'De petits fruits juteux qui poussent en grappes sur des vignes.',
            image: 'assets/fruits/grapes.jpeg',
          ),
          LearningContent(
            name: 'Fraise',
            description: 'Un petit fruit sucré avec une peau rouge et des graines en surface.',
            image: 'assets/fruits/strawberry.jpg',
          ),
          LearningContent(
            name: 'Pastèque',
            description: 'Un gros fruit juteux avec une peau verte et une chair rouge ou rose.',
            image: 'assets/fruits/watermelon.jpeg',
          ),
          LearningContent(
            name: 'Ananas',
            description: 'Un fruit tropical avec une peau marron rugueuse et une chair jaune sucrée.',
            image: 'assets/fruits/pineapple.jpeg',
          ),
          LearningContent(
            name: 'Mangue',
            description: 'Un fruit tropical avec une peau jaune ou orange et une chair juteuse.',
            image: 'assets/fruits/mango.jpeg',
          ),
          LearningContent(
            name: 'Kiwi',
            description: 'Un petit fruit avec une peau marron poilue et une chair verte.',
            image: 'assets/fruits/kiwi.jpeg',
          ),
          LearningContent(
            name: 'Pêche',
            description: 'Un fruit doux avec une peau duveteuse et une chair juteuse et sucrée.',
            image: 'assets/fruits/peach.jpeg',
          ),
        ];


        break;
    }

    return fruits;
  }
  List<LearningContent> getSocialActivities(String language) {
    List<LearningContent> socialActivities = [];

    switch (language) {
      case 'English':
        socialActivities = [
          LearningContent(
            name: 'Meeting friends',
            description: 'Spending time with friends and socializing.',
            image: 'assets/social/friends.jpg',
          ),
          LearningContent(
            name: 'Going to a party',
            description: 'Attending a celebration or social gathering.',
            image: 'assets/social/party.jpeg',
          ),
          LearningContent(
            name: 'Joining a book club',
            description: 'Participating in a group that discusses and reads books together.',
            image: 'assets/social/book_club.jpeg',
          ),
          LearningContent(
            name: 'Attending a concert',
            description: 'Going to a live music performance.',
            image: 'assets/social/concert.jpeg',
          ),
          LearningContent(
            name: 'Playing team sports',
            description: 'Engaging in sports activities with a group of people.',
            image: 'assets/social/team_sport.jpeg',
          ),
          LearningContent(
            name: 'Volunteering for a charity',
            description: 'Offering help and support to a charitable organization.',
            image: 'assets/social/volunteering.jpeg',
          ),
          LearningContent(
            name: 'Joining a community event',
            description: 'Participating in a local gathering or festival.',
            image: 'assets/social/community_event.jpeg',
          ),
          LearningContent(
            name: 'Going on a hike',
            description: 'Exploring nature trails and enjoying outdoor activities.',
            image: 'assets/social/hike.jpeg',
          ),
          LearningContent(
            name: 'Taking a dance class',
            description: 'Learning and practicing various dance styles.',
            image: 'assets/social/dance_class.jpeg',
          ),
          LearningContent(
            name: 'Organizing a game night',
            description: 'Gathering friends for an evening of board games or video games.',
            image: 'assets/social/game_night.jpeg',
          ),
        ];

        break;
      case 'Spanish':
        socialActivities = [
          LearningContent(
            name: 'Salir con amigos',
            description: 'Pasando tiempo con amigos y socializando.',
            image: 'assets/social/friends.png',
          ),
          LearningContent(
            name: 'Ir a una fiesta',
            description: 'Asistiendo a una celebración o reunión social.',
            image: 'assets/social/party.jpeg',
          ),
          LearningContent(
            name: 'Unirse a un club de lectura',
            description: 'Participar en un grupo que discute y lee libros juntos.',
            image: 'assets/social/book_club.jpeg',
          ),
          LearningContent(
            name: 'Asistir a un concierto',
            description: 'Ir a una presentación de música en vivo.',
            image: 'assets/social/concert.jpeg',
          ),
          LearningContent(
            name: 'Jugar deportes en equipo',
            description: 'Practicar actividades deportivas con un grupo de personas.',
            image: 'assets/social/team_sports.jpeg',
          ),
          LearningContent(
            name: 'Ser voluntario para una organización benéfica',
            description: 'Ofrecer ayuda y apoyo a una organización benéfica.',
            image: 'assets/social/volunteering.jpeg',
          ),
          LearningContent(
            name: 'Participar en un evento comunitario',
            description: 'Participar en una reunión o festival local.',
            image: 'assets/social/community_event.jpeg',
          ),
          LearningContent(
            name: 'Ir de excursión',
            description: 'Explorar senderos en la naturaleza y disfrutar de actividades al aire libre.',
            image: 'assets/social/hike.jpeg',
          ),
          LearningContent(
            name: 'Tomar clases de baile',
            description: 'Aprender y practicar diferentes estilos de baile.',
            image: 'assets/social/dance_class.jpeg',
          ),
          LearningContent(
            name: 'Organizar una noche de juegos',
            description: 'Reunir amigos para una velada de juegos de mesa o videojuegos.',
            image: 'assets/social/game_night.jpeg',
          ),
        ];

        break;
      case 'Italian':
        socialActivities = [
          LearningContent(
            name: 'Incontrare gli amici',
            description: 'Trascorrere del tempo con gli amici e socializzare.',
            image: 'assets/social/friends.jpg',
          ),
          LearningContent(
            name: 'Andare a una festa',
            description: 'Partecipare a una celebrazione o incontro sociale.',
            image: 'assets/social/party.jpeg',
          ),
          LearningContent(
            name: 'Unirsi a un club del libro',
            description: 'Partecipare a un gruppo che discute e legge libri insieme.',
            image: 'assets/social/book_club.jpeg',
          ),
          LearningContent(
            name: 'Partecipare a un concerto',
            description: 'Andare a una performance musicale dal vivo.',
            image: 'assets/social/concert.jpeg',
          ),
          LearningContent(
            name: 'Giocare a sport di squadra',
            description: 'Praticare attività sportive con un gruppo di persone.',
            image: 'assets/social/team_sports.jpeg',
          ),
          LearningContent(
            name: 'Volontariato per una causa benefica',
            description: 'Offrire aiuto e supporto a unorganizzazione benefica.',
            image: 'assets/social/volunteering.jpeg',
          ),
          LearningContent(
            name: 'Partecipare a un evento comunitario',
            description: 'Partecipare a un raduno o festival locale.',
            image: 'assets/social/community_event.jpeg',
          ),
          LearningContent(
            name: 'Andare in escursione',
            description: 'Esplorare sentieri naturali e godersi attività allaria aperta.',
            image: 'assets/social/hike.jpeg',
          ),
          LearningContent(
            name: 'Fare lezioni di danza',
            description: 'Imparare e praticare diversi stili di danza.',
            image: 'assets/social/dance_class.jpeg',
          ),
          LearningContent(
            name: 'Organizzare una serata di giochi',
            description: 'Riunire amici per una serata di giochi da tavolo o videogiochi.',
            image: 'assets/social/game_night.jpeg',
          ),
        ];

        break;
      case 'Japanese':
        socialActivities = [
          LearningContent(
            name: '友達と会う',
            description: '友達と時間を過ごし、交流する。',
            image: 'assets/social/friends.jpeg',
          ),
          LearningContent(
            name: 'パーティーに行く',
            description: 'お祝いや社交の集まりに参加する。',
            image: 'assets/social/party.jpeg',
          ),
          LearningContent(
            name: '読書会に参加する',
            description: '一緒に本を読んで話し合うグループに参加する。',
            image: 'assets/social/book_club.jpeg',
          ),
          LearningContent(
            name: 'コンサートに行く',
            description: 'ライブ音楽のパフォーマンスを楽しむ。',
            image: 'assets/social/concert.jpeg',
          ),
          LearningContent(
            name: 'チームスポーツに参加する',
            description: 'グループでスポーツ活動に取り組む。',
            image: 'assets/social/team_sports.jpeg',
          ),
          LearningContent(
            name: 'チャリティー活動のボランティア',
            description: '慈善団体に助けや支援を提供する。',
            image: 'assets/social/volunteering.jpeg',
          ),
          LearningContent(
            name: 'コミュニティイベントに参加する',
            description: '地域の集まりや祭りに参加する。',
            image: 'assets/social/community_event.jpeg',
          ),
          LearningContent(
            name: 'ハイキングに行く',
            description: '自然のトレイルを探検し、アウトドア活動を楽しむ。',
            image: 'assets/social/hike.jpeg',
          ),
          LearningContent(
            name: 'ダンスのレッスンを受ける',
            description: 'さまざまなダンススタイルを学び、練習する。',
            image: 'assets/social/dance_class.jpeg',
          ),
          LearningContent(
            name: 'ゲームナイトを開催する',
            description: '友人たちを集めてボードゲームやビデオゲームを楽しむ。',
            image: 'assets/social/game_night.jpeg',
          ),
        ];

        break;
      case 'French':
        socialActivities = [
          LearningContent(
            name: 'Rencontrer des amis',
            description: 'Passer du temps avec des amis et socialiser.',
            image: 'assets/social/friends.jpg',
          ),
          LearningContent(
            name: 'Aller à une fête',
            description: 'Participer à une célébration ou une réunion sociale.',
            image: 'assets/social/party.jpeg',
          ),
          LearningContent(
            name: 'Rejoindre un club de lecture',
            description: 'Participer à un groupe qui discute et lit des livres ensemble.',
            image: 'assets/social/book_club.jpeg',
          ),
          LearningContent(
            name: 'Assister à un concert',
            description: 'Aller à une performance musicale en direct.',
            image: 'assets/social/concert.jpeg',
          ),
          LearningContent(
            name: 'Jouer à des sports déquipe',
            description: 'Pratiquer des activités sportives avec un groupe de personnes.',
            image: 'assets/social/team_sport.jpeg',
          ),
          LearningContent(
            name: 'Faire du bénévolat pour une association caritative',
            description: 'Offrir de laide et du soutien à une organisation caritative.',
            image: 'assets/social/volunteering.jpeg',
          ),
          LearningContent(
            name: 'Participer à un événement communautaire',
            description: 'Prendre part à une réunion ou un festival local.',
            image: 'assets/social/community_event.jpeg',
          ),
          LearningContent(
            name: 'Faire une randonnée',
            description: 'Explorer des sentiers en pleine nature et profiter dactivités en plein air.',
            image: 'assets/social/hike.jpeg',
          ),
          LearningContent(
            name: 'Prendre des cours de danse',
            description: 'Apprendre et pratiquer différents styles de danse.',
            image: 'assets/social/dance_class.jpeg',
          ),
          LearningContent(
            name: 'Organiser une soirée jeux',
            description: 'Réunir des amis pour une soirée de jeux de société ou de jeux vidéo.',
            image: 'assets/social/game_night.jpeg',
          ),
        ];

        break;
    }

    return socialActivities;
  }

  List<LearningContent> getHouseItems(String language) {
    List<LearningContent> houseItems = [];

    switch (language) {
      case 'English':
        houseItems = [
          LearningContent(
            name: 'Table',
            description: 'A piece of furniture with a flat top and legs, used for eating, working, etc.',
            image: 'assets/house/table.jpeg',
          ),
          LearningContent(
            name: 'Chair',
            description: 'A piece of furniture with a seat and back, used for sitting on.',
            image: 'assets/house/chair.jpeg',
          ),
          LearningContent(
            name: 'Bed',
            description: 'A piece of furniture for sleeping on.',
            image: 'assets/house/bed.jpeg',
          ),
          LearningContent(
            name: 'Couch',
            description: 'A long upholstered piece of furniture for several people to sit on.',
            image: 'assets/house/couch.jpeg',
          ),
          LearningContent(
            name: 'Desk',
            description: 'A piece of furniture with a flat or sloped surface and typically drawers, used for writing, working, etc.',
            image: 'assets/house/desk.jpeg',
          ),
          LearningContent(
            name: 'Lamp',
            description: 'A device that gives light, especially one that is electrically powered and has a bulb or tube.',
            image: 'assets/house/lamp.jpeg',
          ),
          LearningContent(
            name: 'Mirror',
            description: 'A reflective surface, typically of glass coated with a metal amalgam, that reflects a clear image.',
            image: 'assets/house/mirror.jpeg',
          ),
          LearningContent(
            name: 'Shelf',
            description: 'A flat length of wood or rigid material, attached to a wall or forming part of a piece of furniture, used to store or display objects.',
            image: 'assets/house/shelf.jpeg',
          ),
          LearningContent(
            name: 'Dining table',
            description: 'A table at which meals are served, typically with chairs placed around it.',
            image: 'assets/house/dining_table.jpeg',
          ),
          LearningContent(
            name: 'Bookshelf',
            description: 'A shelf or shelves for books.',
            image: 'assets/house/bookshelf.jpeg',
          ),
        ];


        break;
      case 'Spanish':
        houseItems = [
          LearningContent(
            name: 'Mesa',
            description: 'Un mueble con una superficie plana y patas, utilizado para comer, trabajar, etc.',
            image: 'assets/house/table.jpeg',
          ),
          LearningContent(
            name: 'Silla',
            description: 'Un mueble con un asiento y respaldo, utilizado para sentarse.',
            image: 'assets/house/chair.jpeg',
          ),
          LearningContent(
            name: 'Cama',
            description: 'Un mueble para dormir.',
            image: 'assets/house/bed.jpeg',
          ),
          LearningContent(
            name: 'Sofá',
            description: 'Un mueble largo y tapizado en el que pueden sentarse varias personas.',
            image: 'assets/house/couch.jpeg',
          ),
          LearningContent(
            name: 'Escritorio',
            description: 'Un mueble con una superficie plana o inclinada y típicamente cajones, utilizado para escribir, trabajar, etc.',
            image: 'assets/house/desk.jpeg',
          ),
          LearningContent(
            name: 'Lámpara',
            description: 'Un dispositivo que produce luz, especialmente uno que funciona con electricidad y tiene una bombilla o tubo.',
            image: 'assets/house/lamp.jpeg',
          ),
          LearningContent(
            name: 'Espejo',
            description: 'Una superficie reflectante, típicamente de vidrio recubierto con una amalgama de metal, que refleja una imagen clara.',
            image: 'assets/house/mirror.jpeg',
          ),
          LearningContent(
            name: 'Estante',
            description: 'Un trozo plano de madera o material rígido, unido a una pared o formando parte de un mueble, utilizado para almacenar o exhibir objetos.',
            image: 'assets/house/shelf.jpeg',
          ),
          LearningContent(
            name: 'Mesa de comedor',
            description: 'Una mesa en la que se sirven las comidas, típicamente con sillas colocadas alrededor.',
            image: 'assets/house/dining_table.jpeg',
          ),
          LearningContent(
            name: 'Estantería de libros',
            description: 'Un estante o estantes para libros.',
            image: 'assets/house/bookshelf.jpeg',
          ),
        ];

        break;
      case 'Italian':
        houseItems = [
          LearningContent(
            name: 'Tavolo',
            description: 'Un mobile con un piano piatto e gambe, usato per mangiare, lavorare, ecc.',
            image: 'assets/house/table.jpeg',
          ),
          LearningContent(
            name: 'Sedia',
            description: 'Un mobile con un sedile e uno schienale, usato per sedersi.',
            image: 'assets/house/chair.jpeg',
          ),
          LearningContent(
            name: 'Letto',
            description: 'Un mobile per dormire.',
            image: 'assets/house/bed.jpeg',
          ),
          LearningContent(
            name: 'Divano',
            description: 'Un mobile lungo e imbottito su cui possono sedersi più persone.',
            image: 'assets/house/couch.jpeg',
          ),
          LearningContent(
            name: 'Scrivania',
            description: 'Un mobile con una superficie piatta o inclinata e tipicamente cassetti, usato per scrivere, lavorare, ecc.',
            image: 'assets/house/desk.jpeg',
          ),
          LearningContent(
            name: 'Lampada',
            description: 'Un dispositivo che emette luce, specialmente uno che è alimentato elettricamente e ha una lampadina o un tubo.',
            image: 'assets/house/lamp.jpeg',
          ),
          LearningContent(
            name: 'Specchio',
            description: 'Una superficie riflettente, tipicamente di vetro ricoperto da una amalgama di metallo, che riflette un\'immagine nitida.',
            image: 'assets/house/mirror.jpeg',
          ),
          LearningContent(
            name: 'Scaffale',
            description: 'Un pezzo piatto di legno o materiale rigido, attaccato a una parete o facente parte di un mobile, usato per conservare o esporre oggetti.',
            image: 'assets/house/shelf.jpeg',
          ),
          LearningContent(
            name: 'Tavolo da pranzo',
            description: 'Un tavolo su cui vengono serviti i pasti, tipicamente con sedie disposte intorno ad esso.',
            image: 'assets/house/dining_table.jpeg',
          ),
          LearningContent(
            name: 'Scaffale per libri',
            description: 'Uno scaffale o scaffali per i libri.',
            image: 'assets/house/bookshelf.jpeg',
          ),
        ];

        break;
      case 'Japanese':
        houseItems = [
          LearningContent(
            name: 'テーブル',
            description: '平らな天板と脚を持つ家具で、食事や作業に使用されます。',
            image: 'assets/house/table.jpeg',
          ),
          LearningContent(
            name: '椅子',
            description: '座面と背もたれを持つ家具で、座るために使用されます。',
            image: 'assets/house/chair.jpeg',
          ),
          LearningContent(
            name: 'ベッド',
            description: '寝るための家具です。',
            image: 'assets/house/bed.jpeg',
          ),
          LearningContent(
            name: 'ソファ',
            description: '複数の人が座るための長い張り物の家具です。',
            image: 'assets/house/couch.jpeg',
          ),
          LearningContent(
            name: 'デスク',
            description: '平らまたは傾斜した表面と通常は引き出しを持つ家具で、書く、作業するために使用されます。',
            image: 'assets/house/desk.jpeg',
          ),
          LearningContent(
            name: 'ランプ',
            description: '特に電気で動作し、電球や管を持つ光を発する装置です。',
            image: 'assets/house/lamp.jpeg',
          ),
          LearningContent(
            name: '鏡',
            description: '金属の合金でコーティングされたガラス製の反射面で、クリアな映像を反射します。',
            image: 'assets/house/mirror.jpeg',
          ),
          LearningContent(
            name: '棚',
            description: '壁に取り付けられるか、家具の一部となる平らな木材または堅い材料です。物を保管または展示するために使用されます。',
            image: 'assets/house/shelf.jpeg',
          ),
          LearningContent(
            name: 'ダイニングテーブル',
            description: '食事が供されるテーブルで、通常はその周りに椅子が配置されます。',
            image: 'assets/house/dining_table.jpeg',
          ),
          LearningContent(
            name: '本棚',
            description: '本を収納するための棚または棚。',
            image: 'assets/house/bookshelf.jpeg',
          ),
        ];

        break;
      case 'French':
        houseItems = [
          LearningContent(
            name: 'Table',
            description: 'Un meuble avec un plateau plat et des pieds, utilisé pour manger, travailler, etc.',
            image: 'assets/house/table.jpeg',
          ),
          LearningContent(
            name: 'Chaise',
            description: 'Un meuble avec un siège et un dossier, utilisé pour s\'asseoir.',
            image: 'assets/house/chair.jpeg',
          ),
          LearningContent(
            name: 'Lit',
            description: 'Un meuble pour dormir.',
            image: 'assets/house/bed.jpeg',
          ),
          LearningContent(
            name: 'Canapé',
            description: 'Un meuble long et rembourré sur lequel plusieurs personnes peuvent s\'asseoir.',
            image: 'assets/house/couch.jpeg',
          ),
          LearningContent(
            name: 'Bureau',
            description: 'Un meuble avec une surface plate ou inclinée et généralement des tiroirs, utilisé pour écrire, travailler, etc.',
            image: 'assets/house/desk.jpeg',
          ),
          LearningContent(
            name: 'Lampe',
            description: 'Un dispositif qui produit de la lumière, en particulier un dispositif électrique avec une ampoule ou un tube.',
            image: 'assets/house/lamp.jpeg',
          ),
          LearningContent(
            name: 'Miroir',
            description: 'Une surface réfléchissante, généralement en verre recouvert d\'un amalgame de métal, qui reflète une image claire.',
            image: 'assets/house/mirror.jpeg',
          ),
          LearningContent(
            name: 'Étagère',
            description: 'Une planche plate en bois ou en matériau rigide, fixée au mur ou faisant partie d\'un meuble, utilisée pour ranger ou afficher des objets.',
            image: 'assets/house/shelf.jpeg',
          ),
          LearningContent(
            name: 'Table à manger',
            description: 'Une table sur laquelle les repas sont servis, généralement avec des chaises disposées autour.',
            image: 'assets/house/dining_table.jpeg',
          ),
          LearningContent(
            name: 'Étagère à livres',
            description: 'Une étagère ou des étagères pour les livres.',
            image: 'assets/house/bookshelf.jpeg',
          ),
        ];

        break;
    }

    return houseItems;
  }

  List<LearningContent> getFamilyMembers(String language) {
    List<LearningContent> familyMembers = [];

    switch (language) {
      case 'English':
        familyMembers = [
          LearningContent(
            name: 'Mother',
            description: 'A female parent.',
            image: 'assets/family/mother.jpeg',
          ),
          LearningContent(
            name: 'Father',
            description: 'A male parent.',
            image: 'assets/family/father.jpeg',
          ),
          LearningContent(
            name: 'Brother',
            description: 'A male sibling.',
            image: 'assets/family/brother.jpeg',
          ),
          LearningContent(
            name: 'Sister',
            description: 'A female sibling.',
            image: 'assets/family/sister.jpeg',
          ),
          LearningContent(
            name: 'Grandmother',
            description: 'The mother of one\'s parent.',
            image: 'assets/family/grandmother.jpeg',
          ),
          LearningContent(
            name: 'Grandfather',
            description: 'The father of one\'s parent.',
            image: 'assets/family/grandfather.jpeg',
          ),
          LearningContent(
            name: 'Son',
            description: 'A male child.',
            image: 'assets/family/son.jpeg',
          ),
          LearningContent(
            name: 'Daughter',
            description: 'A female child.',
            image: 'assets/family/daughter.jpeg',
          ),
          LearningContent(
            name: 'Uncle',
            description: 'The brother of one\'s parent.',
            image: 'assets/family/uncle.jpeg',
          ),
          LearningContent(
            name: 'Aunt',
            description: 'The sister of one\'s parent.',
            image: 'assets/family/aunt.jpeg',
          ),
        ];



        break;
      case 'Spanish':
        familyMembers = [
          LearningContent(
            name: 'Madre',
            description: 'Una progenitora femenina.',
            image: 'assets/family/mother.jpeg',
          ),
          LearningContent(
            name: 'Padre',
            description: 'Un progenitor masculino.',
            image: 'assets/family/father.jpeg',
          ),
          LearningContent(
            name: 'Hermano',
            description: 'Un hermano masculino.',
            image: 'assets/family/brother.jpeg',
          ),
          LearningContent(
            name: 'Hermana',
            description: 'Una hermana femenina.',
            image: 'assets/family/sister.jpeg',
          ),
          LearningContent(
            name: 'Abuela',
            description: 'La madre de uno de los padres.',
            image: 'assets/family/grandmother.jpeg',
          ),
          LearningContent(
            name: 'Abuelo',
            description: 'El padre de uno de los padres.',
            image: 'assets/family/grandfather.jpeg',
          ),
          LearningContent(
            name: 'Hijo',
            description: 'Un niño masculino.',
            image: 'assets/family/son.jpeg',
          ),
          LearningContent(
            name: 'Hija',
            description: 'Una niña femenina.',
            image: 'assets/family/daughter.jpeg',
          ),
          LearningContent(
            name: 'Tío',
            description: 'El hermano de uno de los padres.',
            image: 'assets/family/uncle.jpeg',
          ),
          LearningContent(
            name: 'Tía',
            description: 'La hermana de uno de los padres.',
            image: 'assets/family/aunt.jpeg',
          ),
        ];

        break;
      case 'Italian':
        familyMembers = [
          LearningContent(
            name: 'Madre',
            description: 'Una genitrice femminile.',
            image: 'assets/family/mother.jpeg',
          ),
          LearningContent(
            name: 'Padre',
            description: 'Un genitore maschile.',
            image: 'assets/family/father.jpeg',
          ),
          LearningContent(
            name: 'Fratello',
            description: 'Un fratello maschile.',
            image: 'assets/family/brother.jpeg',
          ),
          LearningContent(
            name: 'Sorella',
            description: 'Una sorella femminile.',
            image: 'assets/family/sister.jpeg',
          ),
          LearningContent(
            name: 'Nonna',
            description: 'La madre di uno dei genitori.',
            image: 'assets/family/grandmother.jpeg',
          ),
          LearningContent(
            name: 'Nonno',
            description: 'Il padre di uno dei genitori.',
            image: 'assets/family/grandfather.jpeg',
          ),
          LearningContent(
            name: 'Figlio',
            description: 'Un figlio maschile.',
            image: 'assets/family/son.jpeg',
          ),
          LearningContent(
            name: 'Figlia',
            description: 'Una figlia femminile.',
            image: 'assets/family/daughter.jpeg',
          ),
          LearningContent(
            name: 'Zio',
            description: 'Il fratello di uno dei genitori.',
            image: 'assets/family/uncle.jpeg',
          ),
          LearningContent(
            name: 'Zia',
            description: 'La sorella di uno dei genitori.',
            image: 'assets/family/aunt.jpeg',
          ),
        ];

        break;
      case 'Japanese':
        familyMembers = [
          LearningContent(
            name: '母',
            description: '女性の親。',
            image: 'assets/family/mother.jpeg',
          ),
          LearningContent(
            name: '父',
            description: '男性の親。',
            image: 'assets/family/father.jpeg',
          ),
          LearningContent(
            name: '兄弟',
            description: '男性の兄弟。',
            image: 'assets/family/brother.jpeg',
          ),
          LearningContent(
            name: '姉妹',
            description: '女性の兄弟。',
            image: 'assets/family/sister.jpeg',
          ),
          LearningContent(
            name: '祖母',
            description: '親の母。',
            image: 'assets/family/grandmother.jpeg',
          ),
          LearningContent(
            name: '祖父',
            description: '親の父。',
            image: 'assets/family/grandfather.jpeg',
          ),
          LearningContent(
            name: '息子',
            description: '男性の子供。',
            image: 'assets/family/son.jpeg',
          ),
          LearningContent(
            name: '娘',
            description: '女性の子供。',
            image: 'assets/family/daughter.jpeg',
          ),
          LearningContent(
            name: '叔父',
            description: '親の兄弟。',
            image: 'assets/family/uncle.jpeg',
          ),
          LearningContent(
            name: '叔母',
            description: '親の姉妹。',
            image: 'assets/family/aunt.jpeg',
          ),
        ];

        break;
      case 'French':
        familyMembers = [
          LearningContent(
            name: 'Mère',
            description: 'Une parente féminine.',
            image: 'assets/family/mother.jpeg',
          ),
          LearningContent(
            name: 'Père',
            description: 'Un parent masculin.',
            image: 'assets/family/father.jpeg',
          ),
          LearningContent(
            name: 'Frère',
            description: 'Un frère masculin.',
            image: 'assets/family/brother.jpeg',
          ),
          LearningContent(
            name: 'Soeur',
            description: 'Une soeur féminine.',
            image: 'assets/family/sister.jpeg',
          ),
          LearningContent(
            name: 'Grand-mère',
            description: 'La mère d\'un parent.',
            image: 'assets/family/grandmother.jpeg',
          ),
          LearningContent(
            name: 'Grand-père',
            description: 'Le père d\'un parent.',
            image: 'assets/family/grandfather.jpeg',
          ),
          LearningContent(
            name: 'Fils',
            description: 'Un enfant masculin.',
            image: 'assets/family/son.jpeg',
          ),
          LearningContent(
            name: 'Fille',
            description: 'Un enfant féminin.',
            image: 'assets/family/daughter.jpeg',
          ),
          LearningContent(
            name: 'Oncle',
            description: 'Le frère d\'un parent.',
            image: 'assets/family/uncle.jpeg',
          ),
          LearningContent(
            name: 'Tante',
            description: 'La soeur d\'un parent.',
            image: 'assets/family/aunt.jpeg',
          ),
        ];

        break;
    }


    return familyMembers;
  }

  List<LearningContent> getDishes(String language) {
    List<LearningContent> dishes = [];

    switch (language) {
      case 'English':
        dishes = [
          LearningContent(
            name: 'Pizza',
            description: 'A savory dish with a thin crust topped with cheese, sauce, and various toppings.',
            image: 'assets/dish/pizza.jpeg',
          ),
          LearningContent(
            name: 'Sushi',
            description: 'A Japanese dish consisting of vinegared rice rolled with seafood, vegetables, or other ingredients.',
            image: 'assets/dish/sushi.jpeg',
          ),
          LearningContent(
            name: 'Burger',
            description: 'A sandwich made with a grilled patty, typically served with lettuce, tomato, and condiments.',
            image: 'assets/dish/burger.jpeg',
          ),
          LearningContent(
            name: 'Pasta',
            description: 'Italian noodles made from wheat flour, typically served with sauce and various toppings.',
            image: 'assets/dish/pasta.jpeg',
          ),
          LearningContent(
            name: 'Tacos',
            description: 'Mexican tortillas filled with various ingredients such as meat, vegetables, and salsa.',
            image: 'assets/dish/tacos.jpeg',
          ),
          LearningContent(
            name: 'Curry',
            description: 'A spiced dish with a sauce, often containing meat, vegetables, and served with rice or bread.',
            image: 'assets/dish/curry.jpeg',
          ),
          LearningContent(
            name: 'Ramen',
            description: 'A Japanese noodle soup dish with various toppings and a flavorful broth.',
            image: 'assets/dish/ramen.jpeg',
          ),
          LearningContent(
            name: 'Steak',
            description: 'A piece of beef or other meat cooked by grilling or frying.',
            image: 'assets/dish/steak.jpeg',
          ),
          LearningContent(
            name: 'Salad',
            description: 'A dish consisting of a mixture of raw or cooked vegetables, often served with dressing.',
            image: 'assets/dish/salad.jpeg',
          ),
          LearningContent(
            name: 'Pancakes',
            description: 'A breakfast dish made from a batter cooked on a hot griddle or frying pan, often served with syrup or toppings.',
            image: 'assets/dish/pancakes.jpeg',
          ),
        ];


        break;
      case 'Spanish':
        dishes = [
          LearningContent(
            name: 'Pizza',
            description: 'Un plato sabroso con una base delgada cubierta de queso, salsa y diversos ingredientes.',
            image: 'assets/dish/pizza.jpeg',
          ),
          LearningContent(
            name: 'Pancakes',
            description: 'Un plato de desayuno hecho con una masa cocinada en una plancha caliente, a menudo servido con jarabe u otros ingredientes.',
            image: 'assets/dish/pancakes.jpeg',
          ),
          LearningContent(
            name: 'Hamburguesa',
            description: 'Un sándwich hecho con una hamburguesa a la parrilla, generalmente servido con lechuga, tomate y condimentos.',
            image: 'assets/dish/burger.jpeg',
          ),
          LearningContent(
            name: 'Pasta',
            description: 'Fideos italianos hechos de harina de trigo, generalmente servidos con salsa y diversos ingredientes.',
            image: 'assets/dish/pasta.jpeg',
          ),
          LearningContent(
            name: 'Tacos',
            description: 'Tortillas mexicanas rellenas de diversos ingredientes como carne, vegetales y salsa.',
            image: 'assets/dish/tacos.jpeg',
          ),
          LearningContent(
            name: 'Curry',
            description: 'Un plato especiado con una salsa, a menudo con carne, vegetales y servido con arroz o pan.',
            image: 'assets/dish/curry.jpeg',
          ),
          LearningContent(
            name: 'Sushi',
            description: 'Un plato japonés que consiste en arroz avinagrado enrollado con mariscos, vegetales u otros ingredientes.',
            image: 'assets/dish/sushi.jpeg',
          ),
          LearningContent(
            name: 'Filete',
            description: 'Un trozo de carne de res u otra carne cocinada a la parrilla o frita.',
            image: 'assets/dish/steak.jpeg',
          ),
          LearningContent(
            name: 'Ensalada',
            description: 'Un plato que consiste en una mezcla de vegetales crudos o cocidos, a menudo servida con aderezo.',
            image: 'assets/dish/salad.jpeg',
          ),
          LearningContent(
            name: 'Ramen',
            description: 'Una sopa de fideos japonesa con diversos ingredientes y un caldo sabroso.',
            image: 'assets/dish/ramen.jpeg',
          ),
        ];

        break;

      case 'Italian':
        dishes = [
          LearningContent(
            name: 'Pizza',
            description: 'Un piatto saporito con una base sottile ricoperta di formaggio, salsa e vari ingredienti.',
            image: 'assets/dish/pizza.jpeg',
          ),
          LearningContent(
            name: 'Pancakes',
            description: 'Un piatto a base di pancake, solitamente servito con sciroppo o altri ingredienti.',
            image: 'assets/dish/pancakes.jpeg',
          ),
          LearningContent(
            name: 'Hamburger',
            description: 'Un panino con un hamburger alla griglia, solitamente servito con lattuga, pomodoro e condimenti.',
            image: 'assets/dish/burger.jpeg',
          ),
          LearningContent(
            name: 'Pasta',
            description: 'Noodles italiani fatti con farina di grano, solitamente serviti con salsa e vari condimenti.',
            image: 'assets/dish/pasta.jpeg',
          ),
          LearningContent(
            name: 'Tacos',
            description: 'Tortillas messicane ripiene di vari ingredienti come carne, verdure e salsa.',
            image: 'assets/dish/tacos.jpeg',
          ),
          LearningContent(
            name: 'Curry',
            description: 'Un piatto speziato con una salsa, spesso contenente carne, verdure e servito con riso o pane.',
            image: 'assets/dish/curry.jpeg',
          ),
          LearningContent(
            name: 'Sushi',
            description: 'Un piatto giapponese composto da riso condito arrotolato con pesce, verdure o altri ingredienti.',
            image: 'assets/dish/sushi.jpeg',
          ),
          LearningContent(
            name: 'Bistecca',
            description: 'Un pezzo di carne bovina o altra carne cotto alla griglia o fritto.',
            image: 'assets/dish/steak.jpeg',
          ),
          LearningContent(
            name: 'Insalata',
            description: 'Un piatto composto da una miscela di verdure crude o cotte, spesso servito con condimento.',
            image: 'assets/dish/salad.jpeg',
          ),
          LearningContent(
            name: 'Ramen',
            description: 'Una zuppa giapponese con noodles e vari ingredienti in un brodo saporito.',
            image: 'assets/dish/ramen.jpeg',
          ),
        ];

        break;

      case 'Japanese':
        dishes = [
          LearningContent(
            name: 'ピザ',
            description: 'チーズ、ソース、さまざまなトッピングが乗った薄いクラストのおいしい料理。',
            image: 'assets/dish/pizza.jpeg',
          ),
          LearningContent(
            name: 'パンケーキ',
            description: 'ホットプレートで調理された生地で、しばしばシロップなどと一緒に提供される朝食の料理。',
            image: 'assets/dish/pancakes.jpeg',
          ),
          LearningContent(
            name: 'バーガー',
            description: 'グリルで焼いたパティを使ったサンドイッチで、通常はレタス、トマト、調味料と一緒に提供されます。',
            image: 'assets/dish/burger.jpeg',
          ),
          LearningContent(
            name: 'パスタ',
            description: '小麦粉で作られたイタリアの麺で、ソースとさまざまなトッピングと一緒に提供されます。',
            image: 'assets/dish/pasta.jpeg',
          ),
          LearningContent(
            name: 'タコス',
            description: '肉、野菜、サルサなど、さまざまな具材で包まれたメキシコのトルティーヤ。',
            image: 'assets/dish/tacos.jpeg',
          ),
          LearningContent(
            name: 'カレー',
            description: 'スパイスの効いたソースが特徴で、しばしば肉や野菜と一緒に提供され、ご飯やパンと一緒に食べられます。',
            image: 'assets/dish/curry.jpeg',
          ),
          LearningContent(
            name: '寿司',
            description: '酢飯に巻かれた海鮮、野菜、他の具材で作られる日本の料理。',
            image: 'assets/dish/sushi.jpeg',
          ),
          LearningContent(
            name: 'ステーキ',
            description: 'グリルやフライパンで焼かれた牛肉や他の肉の一切れ。',
            image: 'assets/dish/steak.jpeg',
          ),
          LearningContent(
            name: 'サラダ',
            description: '生または調理済みの野菜の混合物で、しばしばドレッシングと一緒に提供されます。',
            image: 'assets/dish/salad.jpeg',
          ),
          LearningContent(
            name: 'ラーメン',
            description: '日本の麺料理で、さまざまな具材と風味豊かなスープが特徴です。',
            image: 'assets/dish/ramen.jpeg',
          ),
        ];

        break;


        break;
    }

    return dishes;
  }

  List<LearningContent> getJobs(String language) {
    List<LearningContent> jobs = [];

    switch (language) {
      case 'English':
        jobs = [
          LearningContent(
            name: 'Doctor',
            description: 'A person who practices medicine and treats patients.',
            image: 'assets/jobs/doctor.jpeg',
          ),
          LearningContent(
            name: 'Teacher',
            description: 'A person who educates and instructs students.',
            image: 'assets/jobs/teacher.jpeg',
          ),
          LearningContent(
            name: 'Engineer',
            description: 'A person who designs and builds complex systems or structures.',
            image: 'assets/jobs/engineer.jpeg',
          ),
          LearningContent(
            name: 'Lawyer',
            description: 'A person who advises and represents clients in legal matters.',
            image: 'assets/jobs/lawyer.jpeg',
          ),
          LearningContent(
            name: 'Chef',
            description: 'A person who cooks and prepares food in a professional kitchen.',
            image: 'assets/jobs/chef.jpeg',
          ),
          LearningContent(
            name: 'Police officer',
            description: 'A person who enforces the law and maintains public order.',
            image: 'assets/jobs/police_officer.jpeg',
          ),
          LearningContent(
            name: 'Firefighter',
            description: 'A person who extinguishes fires and assists in emergencies.',
            image: 'assets/jobs/firefighter.jpeg',
          ),
          LearningContent(
            name: 'Architect',
            description: 'A person who designs buildings and oversees their construction.',
            image: 'assets/jobs/architect.jpeg',
          ),
          LearningContent(
            name: 'Journalist',
            description: 'A person who investigates and reports news stories.',
            image: 'assets/jobs/journalist.jpeg',
          ),
          LearningContent(
            name: 'Accountant',
            description: 'A person who manages financial records and prepares financial statements.',
            image: 'assets/jobs/accountant.jpeg',
          ),
        ];


        break;
      case 'Spanish':
        jobs = [
          LearningContent(
            name: 'Médico/Médica',
            description: 'Persona que practica la medicina y atiende a los pacientes.',
            image: 'assets/jobs/doctor.jpeg',
          ),
          LearningContent(
            name: 'Maestro/Maestra',
            description: 'Persona que educa e instruye a los estudiantes.',
            image: 'assets/jobs/teacher.jpeg',
          ),
          LearningContent(
            name: 'Ingeniero/Ingeniera',
            description: 'Persona que diseña y construye sistemas o estructuras complejas.',
            image: 'assets/jobs/engineer.jpeg',
          ),
          LearningContent(
            name: 'Abogado/Abogada',
            description: 'Persona que asesora y representa a los clientes en asuntos legales.',
            image: 'assets/jobs/lawyer.jpeg',
          ),
          LearningContent(
            name: 'Chef/Chef',
            description: 'Persona que cocina y prepara alimentos en una cocina profesional.',
            image: 'assets/jobs/chef.jpeg',
          ),
          LearningContent(
            name: 'Policía',
            description: 'Persona encargada de hacer cumplir la ley y mantener el orden público.',
            image: 'assets/jobs/police_officer.jpeg',
          ),
          LearningContent(
            name: 'Bombero/Bombera',
            description: 'Persona que apaga incendios y ayuda en situaciones de emergencia.',
            image: 'assets/jobs/firefighter.jpeg',
          ),
          LearningContent(
            name: 'Arquitecto/Arquitecta',
            description: 'Persona que diseña edificios y supervisa su construcción.',
            image: 'assets/jobs/architect.jpeg',
          ),
          LearningContent(
            name: 'Periodista',
            description: 'Persona que investiga y reporta noticias.',
            image: 'assets/jobs/journalist.jpeg',
          ),
          LearningContent(
            name: 'Contador/Contadora',
            description: 'Persona que gestiona registros financieros y prepara estados financieros.',
            image: 'assets/jobs/accountant.jpeg',
          ),
        ];


        break;
      case 'Italian':
        jobs = [
          LearningContent(
            name: 'Medico/Medica',
            description: 'Una persona che pratica la medicina e cura i pazienti.',
            image: 'assets/jobs/doctor.jpeg',
          ),
          LearningContent(
            name: 'Insegnante',
            description: 'Una persona che educa e istruisce gli studenti.',
            image: 'assets/jobs/teacher.jpeg',
          ),
          LearningContent(
            name: 'Ingegnere',
            description: 'Una persona che progetta e costruisce sistemi o strutture complesse.',
            image: 'assets/jobs/engineer.jpeg',
          ),
          LearningContent(
            name: 'Avvocato/Avvocata',
            description: 'Una persona che consiglia e rappresenta i clienti in questioni legali.',
            image: 'assets/jobs/lawyer.jpeg',
          ),
          LearningContent(
            name: 'Chef/Chef',
            description: 'Una persona che cucina e prepara cibo in una cucina professionale.',
            image: 'assets/jobs/chef.jpeg',
          ),
          LearningContent(
            name: 'Poliziotto/Poliziotta',
            description: 'Una persona che fa rispettare la legge e mantiene l\'ordine pubblico.',
            image: 'assets/jobs/police_officer.jpeg',
          ),
          LearningContent(
            name: 'Vigile del fuoco',
            description: 'Una persona che spegne gli incendi e assiste in situazioni di emergenza.',
            image: 'assets/jobs/firefighter.jpeg',
          ),
          LearningContent(
            name: 'Architetto/Architetta',
            description: 'Una persona che progetta edifici e ne sovrintende la costruzione.',
            image: 'assets/jobs/architect.jpeg',
          ),
          LearningContent(
            name: 'Giornalista',
            description: 'Una persona che investiga e riporta notizie.',
            image: 'assets/jobs/journalist.jpeg',
          ),
          LearningContent(
            name: 'Contabile',
            description: 'Una persona che gestisce i record finanziari e prepara gli stati finanziari.',
            image: 'assets/jobs/accountant.jpeg',
          ),
        ];


        break;
      case 'Japanese':
        jobs = [
          LearningContent(
            name: '医者',
            description: '患者を診療し治療する人。',
            image: 'assets/jobs/doctor.jpeg',
          ),
          LearningContent(
            name: '教師',
            description: '学生を教育・指導する人。',
            image: 'assets/jobs/teacher.jpeg',
          ),
          LearningContent(
            name: 'エンジニア',
            description: '複雑なシステムや構造を設計・構築する人。',
            image: 'assets/jobs/engineer.jpeg',
          ),
          LearningContent(
            name: '弁護士',
            description: '法律問題について顧客に助言し代理をする人。',
            image: 'assets/jobs/lawyer.jpeg',
          ),
          LearningContent(
            name: 'シェフ',
            description: 'プロのキッチンで料理を調理・準備する人。',
            image: 'assets/jobs/chef.jpeg',
          ),
          LearningContent(
            name: '警察官',
            description: '法を執行し公共の秩序を維持する人。',
            image: 'assets/jobs/police_officer.jpeg',
          ),
          LearningContent(
            name: '消防士',
            description: '火災を消火し緊急時において援助をする人。',
            image: 'assets/jobs/firefighter.jpeg',
          ),
          LearningContent(
            name: '建築家',
            description: '建物を設計し建設を監督する人。',
            image: 'assets/jobs/architect.jpeg',
          ),
          LearningContent(
            name: 'ジャーナリスト',
            description: 'ニュースを調査・報道する人。',
            image: 'assets/jobs/journalist.jpeg',
          ),
          LearningContent(
            name: '会計士',
            description: '財務記録を管理し財務諸表を作成する人。',
            image: 'assets/jobs/accountant.jpeg',
          ),
        ];


        break;
      case 'French':
        jobs = [
          LearningContent(
            name: 'Médecin',
            description: 'Personne qui pratique la médecine et soigne les patients.',
            image: 'assets/jobs/doctor.jpeg',
          ),
          LearningContent(
            name: 'Enseignant/Enseignante',
            description: 'Personne qui éduque et instruit les élèves.',
            image: 'assets/jobs/teacher.jpeg',
          ),
          LearningContent(
            name: 'Ingénieur/Ingénieure',
            description: 'Personne qui conçoit et construit des systèmes ou des structures complexes.',
            image: 'assets/jobs/engineer.jpeg',
          ),
          LearningContent(
            name: 'Avocat/Avocate',
            description: 'Personne qui conseille et représente les clients dans des affaires juridiques.',
            image: 'assets/jobs/lawyer.jpeg',
          ),
          LearningContent(
            name: 'Chef/Cheffe',
            description: 'Personne qui cuisine et prépare de la nourriture dans une cuisine professionnelle.',
            image: 'assets/jobs/chef.jpeg',
          ),
          LearningContent(
            name: 'Policier/Policère',
            description: 'Personne chargée de faire respecter la loi et de maintenir l\'ordre public.',
            image: 'assets/jobs/police_officer.jpeg',
          ),
          LearningContent(
            name: 'Pompier/Pompière',
            description: 'Personne qui éteint les incendies et aide en cas d\'urgence.',
            image: 'assets/jobs/firefighter.jpeg',
          ),
          LearningContent(
            name: 'Architecte',
            description: 'Personne qui conçoit des bâtiments et en supervise la construction.',
            image: 'assets/jobs/architect.jpeg',
          ),
          LearningContent(
            name: 'Journaliste',
            description: 'Personne qui enquête et rapporte les actualités.',
            image: 'assets/jobs/journalist.jpeg',
          ),
          LearningContent(
            name: 'Comptable',
            description: 'Personne qui gère les registres financiers et prépare les états financiers.',
            image: 'assets/jobs/accountant.jpeg',
          ),
        ];

        break;
    }

    return jobs;
  }
  List<LearningContent> getWeather(String language) {
    List<LearningContent> weather = [];

    switch (language) {
      case 'English':
        weather = [
          LearningContent(
            name: 'Sunny',
            description: 'Clear sky with abundant sunshine.',
            image: 'assets/weather/sunny.jpeg',
          ),
          LearningContent(
            name: 'Cloudy',
            description: 'Sky covered with clouds.',
            image: 'assets/weather/cloudy.jpeg',
          ),
          LearningContent(
            name: 'Rainy',
            description: 'Falling raindrops from the sky.',
            image: 'assets/weather/rainy.jpeg',
          ),
          LearningContent(
            name: 'Windy',
            description: 'Strong air movement with gusts.',
            image: 'assets/weather/windy.jpeg',
          ),
          LearningContent(
            name: 'Snowy',
            description: 'Falling snowflakes covering the ground.',
            image: 'assets/weather/snowy.jpeg',
          ),
          LearningContent(
            name: 'Foggy',
            description: 'Thick fog causing reduced visibility.',
            image: 'assets/weather/foggy.jpeg',
          ),
          LearningContent(
            name: 'Stormy',
            description: 'Violent atmospheric disturbance with thunder and lightning.',
            image: 'assets/weather/stormy.jpeg',
          ),
          LearningContent(
            name: 'Hazy',
            description: 'Reduced visibility due to suspended particles in the air.',
            image: 'assets/weather/hazy.jpeg',
          ),
          LearningContent(
            name: 'Misty',
            description: 'Fine droplets of water suspended in the air, causing reduced visibility.',
            image: 'assets/weather/misty.jpeg',
          ),
          LearningContent(
            name: 'Hot',
            description: 'High temperature and intense heat.',
            image: 'assets/weather/hot.jpeg',
          ),
        ];

        break;
      case 'Spanish':
        weather = [
          LearningContent(
            name: 'Soleado',
            description: 'Cielo despejado con abundante luz solar.',
            image: 'assets/weather/sunny.jpeg',
          ),
          LearningContent(
            name: 'Nublado',
            description: 'Cielo cubierto de nubes.',
            image: 'assets/weather/cloudy.jpeg',
          ),
          LearningContent(
            name: 'Lluvioso',
            description: 'Caída de gotas de lluvia desde el cielo.',
            image: 'assets/weather/rainy.jpeg',
          ),
          LearningContent(
            name: 'Ventoso',
            description: 'Movimiento de aire fuerte con ráfagas.',
            image: 'assets/weather/windy.jpeg',
          ),
          LearningContent(
            name: 'Nevado',
            description: 'Caída de copos de nieve que cubren el suelo.',
            image: 'assets/weather/snowy.jpeg',
          ),
          LearningContent(
            name: 'Brumoso',
            description: 'Espesa niebla que reduce la visibilidad.',
            image: 'assets/weather/foggy.jpeg',
          ),
          LearningContent(
            name: 'Tormentoso',
            description: 'Disturbio atmosférico violento con truenos y relámpagos.',
            image: 'assets/weather/stormy.jpeg',
          ),
          LearningContent(
            name: 'Neblinoso',
            description: 'Finas gotas de agua suspendidas en el aire, que causan baja visibilidad.',
            image: 'assets/weather/misty.jpeg',
          ),
          LearningContent(
            name: 'Caluroso',
            description: 'Alta temperatura y calor intenso.',
            image: 'assets/weather/hot.jpeg',
          ),
          LearningContent(
            name: 'Húmedo',
            description: 'Alta humedad en el ambiente.',
            image: 'assets/weather/humid.jpeg',
          ),
        ];

        break;
      case 'Italian':
        weather = [
          LearningContent(
            name: 'Soleggiato',
            description: 'Cielo sereno con abbondante sole.',
            image: 'assets/weather/sunny.jpeg',
          ),
          LearningContent(
            name: 'Nuvoloso',
            description: 'Cielo coperto di nuvole.',
            image: 'assets/weather/cloudy.jpeg',
          ),
          LearningContent(
            name: 'Piovoso',
            description: 'Caduta di gocce di pioggia dal cielo.',
            image: 'assets/weather/rainy.jpeg',
          ),
          LearningContent(
            name: 'Ventoso',
            description: 'Forte movimento dell\'aria con raffiche.',
            image: 'assets/weather/windy.jpeg',
          ),
          LearningContent(
            name: 'Nevoso',
            description: 'Caduta di fiocchi di neve che coprono il terreno.',
            image: 'assets/weather/snowy.jpeg',
          ),
          LearningContent(
            name: 'Nebbioso',
            description: 'Fitta nebbia che riduce la visibilità.',
            image: 'assets/weather/foggy.jpeg',
          ),
          LearningContent(
            name: 'Tempestoso',
            description: 'Disturbo atmosferico violento con tuoni e fulmini.',
            image: 'assets/weather/stormy.jpeg',
          ),
          LearningContent(
            name: 'Mite',
            description: 'Temperatura gradevole e piacevole.',
            image: 'assets/weather/mild.jpeg',
          ),
          LearningContent(
            name: 'Fresco',
            description: 'Temperatura moderatamente fredda.',
            image: 'assets/weather/cool.jpeg',
          ),
          LearningContent(
            name: 'Caldo',
            description: 'Temperatura elevata e calore intenso.',
            image: 'assets/weather/hot.jpeg',
          ),
        ];

        break;
      case 'Japanese':
        weather = [
          LearningContent(
            name: '晴れ',
            description: '晴天でたくさんの日差し。',
            image: 'assets/weather/sunny.jpeg',
          ),
          LearningContent(
            name: '曇り',
            description: '雲が空を覆っている。',
            image: 'assets/weather/cloudy.jpeg',
          ),
          LearningContent(
            name: '雨',
            description: '空から降る雨滴。',
            image: 'assets/weather/rainy.jpeg',
          ),
          LearningContent(
            name: '風',
            description: '強い風が吹き荒れている。',
            image: 'assets/weather/windy.jpeg',
          ),
          LearningContent(
            name: '雪',
            description: '地面を覆う雪片が降っている。',
            image: 'assets/weather/snowy.jpeg',
          ),
          LearningContent(
            name: '霧',
            description: '視界が低下するほどの濃い霧。',
            image: 'assets/weather/foggy.jpeg',
          ),
          LearningContent(
            name: '嵐',
            description: '雷や稲妻を伴う激しい気象の乱れ。',
            image: 'assets/weather/stormy.jpeg',
          ),
          LearningContent(
            name: '湿度',
            description: '空気中の湿気の量が高い。',
            image: 'assets/weather/hazy.jpeg',
          ),
          LearningContent(
            name: '暖かい',
            description: '高い気温と強い暑さ。',
            image: 'assets/weather/hot.jpeg',
          ),
          LearningContent(
            name: '寒い',
            description: '気温が低く寒さが厳しい。',
            image: 'assets/weather/misty.jpeg',
          ),
        ];

        break;

      case 'French':
        weather = [
          LearningContent(
            name: 'Ensoleillé',
            description: 'Ciel dégagé avec beaucoup de soleil.',
            image: 'assets/weather/sunny.jpeg',
          ),
          LearningContent(
            name: 'Nuageux',
            description: 'Ciel couvert de nuages.',
            image: 'assets/weather/cloudy.jpeg',
          ),
          LearningContent(
            name: 'Pluvieux',
            description: 'Chute de gouttes de pluie du ciel.',
            image: 'assets/weather/rainy.jpeg',
          ),
          LearningContent(
            name: 'Venteux',
            description: 'Mouvement d\'air fort avec des rafales.',
            image: 'assets/weather/windy.jpeg',
          ),
          LearningContent(
            name: 'Neigeux',
            description: 'Chute de flocons de neige recouvrant le sol.',
            image: 'assets/weather/snowy.jpeg',
          ),
          LearningContent(
            name: 'Brumeux',
            description: 'Épais brouillard réduisant la visibilité.',
            image: 'assets/weather/foggy.jpeg',
          ),
          LearningContent(
            name: 'Orageux',
            description: 'Trouble atmosphérique violent avec tonnerre et éclairs.',
            image: 'assets/weather/stormy.jpeg',
          ),
          LearningContent(
            name: 'Humide',
            description: 'Teneur élevée en humidité dans l\'air.',
            image: 'assets/weather/humid.jpeg',
          ),
          LearningContent(
            name: 'DouxD',
            description: 'Température agréable et douce.',
            image: 'assets/weather/mild.jpeg',
          ),
          LearningContent(
            name: 'Chaud',
            description: 'Température élevée et chaleur intense.',
            image: 'assets/weather/hot.jpeg',
          ),
        ];

        break;

    }

    return weather;
  }



}

class LearningContent {
  final String name;
  final String description;
  final String image;

  LearningContent({required this.name, required this.description, required this.image});
}


