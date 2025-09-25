class WordItem {
  final String word;
  final String meaning;
  final String example;
  final String shortPhrase;
  final List<String> fixedStructures;
  final List<String> idioms;

  WordItem({
    required this.word,
    required this.meaning,
    required this.example,
    required this.shortPhrase,
    this.fixedStructures = const [],
    this.idioms = const [],
  });
}

final List<WordItem> wordData = [
  WordItem(
    word: "Go",
    meaning: "Gitmek",
    example: "I go to school every day",
    shortPhrase: "Go on!",
    fixedStructures: ["Go on", "Go up"],
    idioms: ["Go the extra mile"],
  ),
  WordItem(
    word: "Come",
    meaning: "Gelmek",
    example: "Please come to my party",
    shortPhrase: "Come here!",
    fixedStructures: ["Come across", "Come back"],
    idioms: ["Come rain or shine"],
  ),
  WordItem(
    word: "See",
    meaning: "Görmek",
    example: "I see a bird in the tree",
    shortPhrase: "See you later!",
    fixedStructures: ["See through", "See off"],
    idioms: ["See eye to eye"],
  ),
  WordItem(
    word: "Eat",
    meaning: "Yemek",
    example: "We eat dinner at 7 PM",
    shortPhrase: "Eat your vegetables!",
    fixedStructures: ["Eat out", "Eat up"],
    idioms: ["Eat humble pie"],
  ),
  WordItem(
    word: "Drink",
    meaning: "İçmek",
    example: "She drinks water after running",
    shortPhrase: "Drink up!",
    fixedStructures: ["Drink in", "Drink up"],
    idioms: ["Drink like a fish"],
  ),
  WordItem(
    word: "Run",
    meaning: "Koşmak",
    example: "They run in the park every morning",
    shortPhrase: "Run fast!",
    fixedStructures: ["Run into", "Run out"],
    idioms: ["Run for your life"],
  ),
  WordItem(
    word: "Walk",
    meaning: "Yürümek",
    example: "He walks to work every day",
    shortPhrase: "Walk with me!",
    fixedStructures: ["Walk out", "Walk away"],
    idioms: ["Walk the talk"],
  ),
  WordItem(
    word: "Read",
    meaning: "Okumak",
    example: "I read a book before bed",
    shortPhrase: "Read this!",
    fixedStructures: ["Read over", "Read out"],
    idioms: ["Read between the lines"],
  ),
  WordItem(
    word: "Write",
    meaning: "Yazmak",
    example: "She writes in her journal daily",
    shortPhrase: "Write it down!",
    fixedStructures: ["Write down", "Write up"],
    idioms: ["Write off"],
  ),
  WordItem(
    word: "Speak",
    meaning: "Konuşmak",
    example: "We speak English at school",
    shortPhrase: "Speak louder!",
    fixedStructures: ["Speak up", "Speak out"],
    idioms: ["Speak of the devil"],
  ),
];
