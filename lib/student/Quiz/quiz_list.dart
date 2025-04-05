// lib/student/quiz_list.dart
import 'package:flutter/material.dart';
import '../models/quiz.dart';

class QuizListScreen extends StatelessWidget {
  final List<Quiz> quizzes = [
    Quiz(
      id: '1',
      title: 'Math Quiz',
      questions: [
        Question(
          qno: 1,
          question: 'What is 2+2?',
          options: ['3', '4', '5', '6'],
          correctOption: 1,
        ),
        // Add more questions...
      ],
      dueDate: DateTime.now().add(Duration(days: 7)),
      uploadedDate: DateTime.now(),
    ),
    // Add more quizzes...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Quizzes'),
      ),
      body: ListView.builder(
        itemCount: quizzes.length,
        itemBuilder: (context, index) {
          final quiz = quizzes[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(quiz.title),
              subtitle: Text('Due: ${quiz.dueDate.toString().split(' ')[0]}'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(quiz: quiz),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}