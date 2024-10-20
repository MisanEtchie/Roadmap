import 'package:flutter/material.dart';
import 'package:roadmap_game/models/character.dart';
import 'package:roadmap_game/models/story.dart';
import 'package:roadmap_game/models/story_model.dart';

class TypeBgCard extends StatelessWidget {
  final Story story;


  TypeBgCard({required this.story,});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          // Character Image Row
          
          // Text Section
          SizedBox(height: MediaQuery.of(context).size.width ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title "You"
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //   child: Text(
                //     "You",
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                //SizedBox(height: 8),
                // Story Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    story.title,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      
    );
  }
}
