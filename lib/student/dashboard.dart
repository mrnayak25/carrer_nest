import 'package:flutter/material.dart';
import '../quiz_page.dart'; // Import Quiz Page

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

            // QUIZ Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()),
                );
              },
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 16),
                  const Text("QUIZ", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // Add other buttons below...
          ],
        ),
      ),
    );
  }
}

