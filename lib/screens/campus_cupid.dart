import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';


class CampusCupidPage extends StatefulWidget {
  @override
  _CampusCupidPageState createState() => _CampusCupidPageState();
}

class _CampusCupidPageState extends State<CampusCupidPage> {
  int _currentQuestionIndex = 0;
  bool _showThinkingAnimation = false;
  bool _lastQuestion = false;
  List<String> questions = [
    "What’s your ideal weekend activity?",
    "How do you handle conflicts?",
    "What’s your favorite type of music?",
    "Are you more introverted or extroverted?",
    "What kind of movies do you prefer?",
    "Do you like adventurous dates?",
    "How do you express affection?",
    "Do you prefer texting or calling?",
    "What’s your dream travel destination?",
    "Are you more logical or emotional in decision-making?"
  ];

  List<List<String>> options = [
    ["Netflix & Chill", "Outdoor Adventure", "Clubbing", "Reading a Book"],
    ["Talk it out", "Ignore", "Apologize", "Let it cool down"],
    ["Pop", "Rock", "Jazz", "Classical"],
    ["Introverted", "Extroverted", "Ambivert", "Depends on Mood"],
    ["Action", "Romance", "Comedy", "Sci-Fi"],
    ["Yes!", "Sometimes", "Not really", "Never"],
    ["Words of Affirmation", "Quality Time", "Gifts", "Physical Touch"],
    ["Texting", "Calling", "Both", "Depends on Mood"],
    ["Paris", "Bali", "New York", "Switzerland"],
    ["Logical", "Emotional", "Balanced", "Depends on Situation"]
  ];

  String? selectedOption;

  void _nextQuestion() {
    if (_currentQuestionIndex < questions.length - 1) {
      setState(() {
        _showThinkingAnimation = true;
      });

      Timer(Duration(seconds: 2), () {
        setState(() {
          _currentQuestionIndex++;
          selectedOption = null;
          _showThinkingAnimation = false;
        });
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Matching in progress..."))
      );
      setState(() {
        _lastQuestion = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CampusCupid", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red[800],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bgtwo.jpg', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.white.withValues(alpha: 0.8), // Optional overlay for better readability
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LinearProgressIndicator(
                  value: (_currentQuestionIndex + 1) / questions.length,
                  backgroundColor: Colors.grey[300],
                  color: Colors.red[800],
                  minHeight: 8,
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _lastQuestion ?
                        Center(child: Text("We will soon match you with someone having shared interests and most compatible with you. You can expect upto 2 matches per week!", style: TextStyle(fontSize: 20,),),):
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Question ${_currentQuestionIndex + 1} of ${questions.length}",
                          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                        SizedBox(height: 10),
                        Text(
                          questions[_currentQuestionIndex],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        ...options[_currentQuestionIndex].map((option) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: selectedOption == option ? Colors.red[800] : Colors.white,
                              foregroundColor: selectedOption == option ? Colors.white : Colors.black,
                              side: BorderSide(color: Colors.red.shade800),
                              elevation: selectedOption == option ? 5 : 2,
                            ),
                            onPressed: () {
                              setState(() {
                                selectedOption = option;
                              });
                            },
                            child: Text(option, style: TextStyle(fontSize: 16)),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                _showThinkingAnimation
                    ? Column(
                  children: [
                    CircularProgressIndicator(color: Colors.red[800]),
                    SizedBox(height: 10),
                    Text(
                      "Calculating compatibility with someone...",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Answer more questions to improve your match!",
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                )
                    : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[800],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: selectedOption != null ? _nextQuestion : null,
                  child: Text("Next", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ].animate(interval: 300.ms, effects: [FadeEffect(duration: 500.ms)]),
      ),
    );
  }
}
