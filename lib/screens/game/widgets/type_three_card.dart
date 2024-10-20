import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roadmap_game/models/character.dart';
import 'package:roadmap_game/models/story.dart';
import 'package:roadmap_game/models/story_model.dart';

class TypeThreeCard extends ConsumerStatefulWidget {
  final Story story;
  final Character character;

  TypeThreeCard({required this.story, required this.character});

  @override
  ConsumerState<TypeThreeCard> createState() => _TypeThreeCardState();
}

class _TypeThreeCardState extends ConsumerState<TypeThreeCard> {
  
  String getCharacterImage (Character char, Emotion emotion) {
    switch (emotion) {
      case Emotion.Shocked:
        return char.shockedImage;
      case Emotion.Happy:
        return char.happyImage; // Example image path for Happy
      
      default:
        return char.defaultImage; // Default image
    }
  }

  


  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          // Character Image Row
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                

                CircleAvatar(
                  radius: MediaQuery.of(context).size.width / 5, // Adjusts the size of the image
                  backgroundImage: AssetImage(getCharacterImage(widget.character, widget.story.emotion)
                  
                  ), // Combine character and story image
                ),
                
              ],
            ),
          ),
          // Text Section
          SizedBox(height: 20),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.character.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                // Story Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.story.title,
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
