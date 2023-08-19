class QuizQuestions{

  QuizQuestions(this.text, this.options);

  final String text;
  final List<String> options;


   List <String> get shuffledList {
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
   }
}

