class Quiz {
  int id;
  String question;
  List<String> possibleAnswers;
  String correctAnswer;

  Quiz({
    required this.id,
    required this.question,
    required this.possibleAnswers,
    required this.correctAnswer,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        id: json["id"],
        question: json["question"],
        possibleAnswers:
            List<String>.from(json["possibleAnswers"].map((x) => x)),
        correctAnswer: json["correctAnswer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "possibleAnswers": List<dynamic>.from(possibleAnswers.map((x) => x)),
        "correctAnswer": correctAnswer,
      };
}
