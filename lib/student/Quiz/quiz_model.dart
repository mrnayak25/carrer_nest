// lib/models/quiz.dart
class Quiz {
  final String id;
  final String title;
  final List<Question> questions;
  final DateTime dueDate;
  final DateTime uploadedDate;

  Quiz({
    required this.id,
    required this.title,
    required this.questions,
    required this.dueDate,
    required this.uploadedDate,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      title: json['title'],
      questions: (json['questions'] as List)
          .map((q) => Question.fromJson(q))
          .toList(),
      dueDate: DateTime.parse(json['due_date']),
      uploadedDate: DateTime.parse(json['uploaded_date']),
    );
  }
}

class Question {
  final int qno;
  final String question;
  final List<String> options;
  final int correctOption;

  Question({
    required this.qno,
    required this.question,
    required this.options,
    required this.correctOption,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      qno: json['qno'],
      question: json['question'],
      options: [
        json['options_1'],
        json['options_2'],
        json['options_3'],
        json['options_4'],
      ],
      correctOption: json['correct_option'],
    );
  }
}
