// lib/student/dashboard.dart
import 'package:flutter/material.dart';
import 'quiz_list.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizListScreen(),
                  ),
                );
              },
              child: Text('View Quizzes'),
            ),
            // Add other dashboard items...
          ],
        ),
      ),
    );
  }
}