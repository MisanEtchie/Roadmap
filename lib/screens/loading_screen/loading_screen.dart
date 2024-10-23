// lib/loading_screen.dart

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roadmap_game/main.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  // List of loading messages
  final List<String> loadingMessages = [
    "Loading characters...",
    "Writing mystery...",
    "Initializing game...",
    "Fetching data...",
    "Setting up the world...",
    "Preparing your adventure...",
    "Crafting stories...",
    "Assembling assets...",
    "Building the universe...",
    "Almost there...",
    "Configuring settings...",
    "Calibrating systems...",
    "Syncing data...",
    "Analyzing environment...",
    "Loading assets...",
    "Finalizing setup...",
    "Connecting to servers...",
    "Generating content...",
    "Optimizing performance...",
    
  ];

  String currentMessage = "Loading characters..."; // Initial message
  Timer? messageTimer; // Timer for changing messages
  Timer? navigationTimer; // Timer for navigation
  late AnimationController _animationController; // Controls the loading bar animation

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController for the loading bar
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // 5-second loading duration
    );

    // Start the loading bar animation
    _animationController.forward();

    // Initialize the message timer to change messages every 3 seconds
    messageTimer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        currentMessage = getRandomMessage();
      });
    });

    // Initialize the navigation timer to navigate after 5 seconds
    navigationTimer = Timer(Duration(seconds: 5), () {
      navigateToMyApp();
    });
  }

  // Function to select a random loading message
  String getRandomMessage() {
    final random = Random();
    return loadingMessages[random.nextInt(loadingMessages.length)];
  }

  // Function to navigate to MyApp
  void navigateToMyApp() {
    // Cancel timers to prevent memory leaks
    messageTimer?.cancel();
    navigationTimer?.cancel();

    // Navigate to MyApp and remove the LoadingScreen from the stack
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  @override
  void dispose() {
    // Dispose of the AnimationController and timers to free resources
    _animationController.dispose();
    messageTimer?.cancel();
    navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Stack allows layering of widgets
        children: [
          // Full-Screen Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg4.jpg', // Ensure the path is correct
              fit: BoxFit.cover,
            ),
          ),
          // Semi-transparent overlay for better text visibility (optional)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          // Centered Content
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0), // Adjust as needed
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Dynamic Loading Text
                  Text(
                    currentMessage,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Loading Bar
                  Container(
  width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
  height: 12,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.white.withOpacity(0.3), // Background color
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(12), // Border radius for progress bar
    child: AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: _animationController.value,
          backgroundColor: Colors.transparent, // Keep it transparent to blend with outer container
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
        );
      },
    ),
  ),
),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
