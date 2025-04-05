import 'package:flutter/material.dart';
import '../quiz_page.dart';
import '../technical_page.dart';
import '../programming_page.dart';
import '../hr_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tests")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Choose your Test", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),

            // QUIZ
            _buildTestTile(context, "QUIZ", const QuizPage()),

            const SizedBox(height: 16),

            // Technical
            _buildTestTile(context, "Technical", const TechnicalPage()),

            const SizedBox(height: 16),

            // Programming
            _buildTestTile(context, "Programming", const ProgrammingPage()),

            const SizedBox(height: 16),

            // HR
            _buildTestTile(context, "HR", const HRPage()),
          ],
        ),
      ),
    );
  }

  // Reusable tile
  Widget _buildTestTile(BuildContext context, String label, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 16),
          Text(label, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}


