import 'package:flutter/material.dart';

class PersonButton extends StatelessWidget {
  const PersonButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black.withOpacity(0.2)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.person, color: Colors.black,),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black.withOpacity(0.2)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.settings, color: Colors.black,),
      ),
    );
  }
}

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black.withOpacity(0.2)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.arrow_back, color: Colors.black,),
      ),
    );
  }
}