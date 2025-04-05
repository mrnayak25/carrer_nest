// Update your main.dart imports
import 'package:flutter/material.dart';
import './student/dashboard.dart';
import './student/quiz_list.dart';
import './student/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/dashboard': (context) => DashboardPage(),
        '/quizzes': (context) => QuizListScreen(),
      },
    );
  }
}

// Keep your existing SplashScreen implementation
