import 'package:flutter/material.dart';
import 'package:roadmap_game/models/character.dart';
import 'package:roadmap_game/models/story.dart';
import 'package:roadmap_game/models/story_model.dart';
import 'package:roadmap_game/screens/game/widgets/game_button.dart';

class TypePickerCard extends StatefulWidget {
  final Story story;
  final Function(String backdrop, int storyNumber) func;
  

  TypePickerCard({required this.story, required this.func});

  @override
  State<TypePickerCard> createState() => _TypePickerCardState();
}

class _TypePickerCardState extends State<TypePickerCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          // Character Image Row
          
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

          Column(
                            children: widget.story.choices.map((choice) {
                              String choiceText =
                                  choice.keys.first; // Extract the choice text
                              int nextStoryIndex = choice.values
                                  .first; // Extract the associated story index

                              return Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // Update the background based on the selected level and next story

                                     widget.func(
                    widget.story.bg.toString(), // or whatever logic you need for backdrop
                    nextStoryIndex,
                  );
                                    });
                                  },
                                  child: PickerButton(text: choiceText, size: widget.story.choices.length == 2 ? MediaQuery.of(context).size.width * 0.5 : MediaQuery.of(context).size.width * 0.3),
                                ),
                              );

                 
                            }).toList(),
                          ),
        ],
      
    );
  }
}


class PickerButton extends StatelessWidget {
  const PickerButton({super.key, required this.text, required this.size });

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    width: double.infinity,
                                    height: size,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0, horizontal: 16.0),
                                      child: Image.asset(text)
                                      
                                     
                                    ),
                                  );
  }
}