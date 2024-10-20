import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.2)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.home, color: Colors.white,),
      ),
    );
  }
}

class SpeakerButton extends StatelessWidget {
  const SpeakerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.2)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.volume_up_rounded, color: Colors.white,),
      ),
    );
  }
}