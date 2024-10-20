import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roadmap_game/models/character.dart';
import 'package:roadmap_game/models/story.dart';
import 'package:roadmap_game/models/story_model.dart';
import 'package:roadmap_game/providers/main_provider.dart';
import 'package:roadmap_game/screens/character_picker/love_picker.dart';
import 'package:roadmap_game/screens/game/widgets/game_button.dart';
import 'package:roadmap_game/screens/game/widgets/home_button.dart';
import 'package:roadmap_game/screens/game/widgets/type_love_card.dart';
import 'package:roadmap_game/screens/game/widgets/type_one_card.dart';
import 'package:roadmap_game/screens/game/widgets/type_picker_card.dart';
import 'package:roadmap_game/screens/game/widgets/type_three_card.dart';
import 'package:roadmap_game/screens/game/widgets/type_two_card.dart';
import 'package:roadmap_game/screens/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Assuming the Story model is in story.dart

class GameView extends ConsumerStatefulWidget {
  final Character mainCharacter;
  final Level level;
  late StreamController<Character?> loveController;

  final int currentGamePlay;

  GameView({required this.mainCharacter, required this.level, required this.currentGamePlay});

  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends ConsumerState<GameView> {
  int storyNumber = 0;
  String? backdrop;
  SharedPreferences? _prefs;
  Character? selectedLove;
  

 

  @override
  void initState() {
    super.initState();
    storyNumber = widget.currentGamePlay;
    loveController = ref.read(loveControllerProvider);
    _initializeSharedPreferences(); // Initialize SharedPreferences to load love character
  }

  Future<void> _initializeSharedPreferences() async {
    _prefs = await ref.read(sharedPreferenceProvider);
    await _loadSelectedLove(); // Load the selected love character
  }

  Future<void> _loadSelectedLove() async {
    final loveJson = _prefs?.getString('love');
    if (loveJson != null) {
      final loveMap = jsonDecode(loveJson) as Map<String, dynamic>;
      setState(() {
        selectedLove = Character.fromMap(loveMap);
      });
    }
  }


  @override
  void dispose() {
    //Stop audio when the widget is disposed
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
  final level = ref.watch(levelProvider.notifier);
  final gameplay = ref.read(gameplayProvider.notifier);
    final story = widget.level.stories[storyNumber]; // Assuming StoryBrain is defined
    

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
               StoryBackgroundHelper.getBackgroundImage(story.bg ?? StoryBackground.bg1), // Assuming `bg` is nullable now
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.2)),
          ),
          SafeArea(
            child: Column(
              children: [
                // Top navigation bar with "house" button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      GestureDetector(
                        //icon: Icon(Icons.home),
                        onTap: () {
                          Navigator.of(context).pop();
                          //player.stop(); // Stop audio when leaving

                          
                        },
                        child: HomeButton(),
                        //color: Colors.white,
                      ),
                      Spacer(),
                      SpeakerButton()
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        // Card Type Widgets

                        

                        if (story.type == StoryType.TypeOneCard)
                          TypeOneCard(
                            story: story,
                          )
                        else if (story.type == StoryType.TypeTwoCard)
                          TypeTwoCard(
                              story: story, character: widget.mainCharacter)
                        else if (story.type == StoryType.TypeThreeCard)
                          TypeThreeCard(
                              story: story, character: story.speaker!)

                              else if (story.type == StoryType.TypePickerCard)
                              TypePickerCard(story: story, func: (String backdrop, int storyNumber) {
    setState(() {
      this.backdrop = backdrop;
      this.storyNumber = storyNumber;
    });
  },)
  else if (story.type == StoryType.TypeLovePickerCard)

  
  _showLoveCardBottomSheet(context, story)

   else if (story.type == StoryType.TypeLoveCard)
   Column(
     children: [
      //Text(selectedLove!.happyImage),
       TypeThreeCard(
                                  story: story, character: ref.read(selectedLoveProvider.notifier).state!),
     ],
   ),

  


                        // Choices Buttons
                        if (
                            story.choices[0].keys.first == 'THE END')
                          Padding(
                             padding: const EdgeInsets.only(top: 12),
                            child: 
                            
                            GestureDetector(
                              onTap: () {
                                level.increment();
                                gameplay.setGameplay(0);
                                Navigator.of(context).pop(); // Exit the current page
                              },
                              child: GameButton(text: "End Game"),
                            ),
                          )
                        else if (story.type != StoryType.TypePickerCard && story.choices.length >= 2)
                        

                        
                          Column(
                            children: story.choices.map((choice) {
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

                                      backdrop = widget.level.stories[nextStoryIndex].bg
                                          .toString(); // Convert enum to string for display

                                      storyNumber = nextStoryIndex;

                                      //final levelProvider = ref.read(levelProvider.notifier);

                                      gameplay.setGameplay(nextStoryIndex);
                                    });
                                  },
                                  child: GameButton(text: choiceText)
                                ),
                              );

                 
                            }).toList(),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        

        if  (story.choices.length == 1 && story.choices[0].keys.first != 'THE END')
         Padding(
           padding: const EdgeInsets.only(top: 120),
           child: GestureDetector(
                        onTap: () {
                          setState(() {
                            storyNumber = story.choices[0].values.first;
                             gameplay.setGameplay( story.choices[0].values.first);
                          });
                        },
                        child: Container(
                          color: Colors.transparent, // Invisible overlay
                        ),
                      ),
         ),

       
        ],
      ),
    );
  }


  Widget _showLoveCardBottomSheet(BuildContext context, Story story) {
    // Using Future.microtask to ensure the build method completes before showing the dialog
    Future.microtask(() => _showBottomSheet(context, story));

    // Return an empty container as the Bottom Sheet is displayed separately
    return Container();
  }

  /// Method to display the Bottom Sheet
  void _showBottomSheet(BuildContext context, Story story) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Makes the Bottom Sheet full screen if needed
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: MediaQuery.of(context).size.height * 0.6, // Adjust as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Drag Handle
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Title
                Text(
                  'Choose your love interest',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                

                SizedBox(height: 10),
                // Story Content
                //Expanded(
                  //child: 
                  SingleChildScrollView(
                    child: LovePicker()
                  ),
                //),
                // Action Buttons
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     ElevatedButton(
                //       onPressed: () {
                //         Navigator.of(context).pop(); // Close the Bottom Sheet
                //       },
                //       child: Text('Close'),
                      
                //     ),
                //     ElevatedButton(
                //       onPressed: () {
                //         // Advance the story or perform any action
                //         // For example, navigate to the next story
                //         Navigator.of(context).pop(); // Close the Bottom Sheet
                //         setState(() {
                //           // Assuming you have a nextStoryIndex defined
                //           int nextStoryIndex = story.choices[0].values.first; // Ensure `nextIndex` exists
                //           backdrop = widget.level.stories[nextStoryIndex].bg.toString();
                //           storyNumber = nextStoryIndex;
                //           //gameplay.setGameplay(nextStoryIndex);
                //         });
                //       },
                //       child: Text('Next'),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        );
      },
    );
  }


}

// TypeOneCard, TypeTwoCard, TypeThreeCard should be separate widgets you define for the respective story types.
