import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  const GameButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0, horizontal: 16.0),
                                      child: Text(text, style: const TextStyle(fontSize: 16),),
                                    ),
                                  );
  }
}