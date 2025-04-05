// lib/student/quiz_screen.dart
import 'package:flutter/material.dart';
import '../models/quiz.dart';

class QuizScreen extends StatefulWidget {
  final Quiz quiz;

  const QuizScreen({Key? key, required this.quiz}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<int?> selectedOptions;
  int currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedOptions = List.filled(widget.quiz.questions.length, null);
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.quiz.questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / widget.quiz.questions.length,
            ),
            SizedBox(height: 20),
            Text(
              'Question ${currentQuestion.qno}:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              currentQuestion.question,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ...currentQuestion.options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              return RadioListTile<int>(
                title: Text(option),
                value: index,
                groupValue: selectedOptions[currentQuestionIndex],
                onChanged: (int? value) {
                  setState(() {
                    selectedOptions[currentQuestionIndex] = value;
                  });
                },
              );
            }).toList(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentQuestionIndex > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentQuestionIndex--;
                      });
                    },
                    child: Text('Previous'),
                  ),
                if (currentQuestionIndex == widget.quiz.questions.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      _submitQuiz();
                    },
                    child: Text('Submit'),
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentQuestionIndex++;
                      });
                    },
                    child: Text('Next'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _submitQuiz() {
    int score = 0;
    for (int i = 0; i < widget.quiz.questions.length; i++) {
      if (selectedOptions[i] == widget.quiz.questions[i].correctOption) {
        score++;
      }
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz Submitted'),
        content: Text('Your score: $score/${widget.quiz.questions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to quiz list
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}