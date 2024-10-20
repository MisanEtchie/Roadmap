import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roadmap_game/models/character.dart';
import 'package:roadmap_game/models/story.dart';
import 'package:roadmap_game/models/story_model.dart';
import 'package:roadmap_game/providers/main_provider.dart';
import 'package:roadmap_game/screens/character_picker/love_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TypeLoveCard extends ConsumerStatefulWidget {
  final Story story;
  final Character selectedLove;
  

  TypeLoveCard({required this.story, required this.selectedLove});

  @override
  ConsumerState<TypeLoveCard> createState() => _TypeLoveCardState();
}

class _TypeLoveCardState extends ConsumerState<TypeLoveCard> {

  SharedPreferences? _prefs;
  //Character? selectedLove;
  late StreamController<Character?> loveController;
  
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
  void initState() {
    super.initState();
    // Initialize the StreamController
    loveController = ref.read(loveControllerProvider);
    // Initialize SharedPreferences asynchronously
    _initializeSharedPreferences();
  }

  void _initializeSharedPreferences() async {
    // Await the FutureProvider for SharedPreferences
    _prefs = await ref.read(sharedPreferenceProvider);
    //await _loadSelectedLove();
  }

  


  

  // Future<void> _loadSelectedLove() async {
  //   final loveJson = _prefs?.getString('love');
  //   if (loveJson != null) {
  //     final loveMap = jsonDecode(loveJson) as Map<String, dynamic>;
  //     setState(() {
  //       selectedLove = Character.fromMap(loveMap);
  //     });
  //     // Update the provider
  //     ref.read(selectedLoveProvider.notifier).state = selectedLove!;
  //     // Add to StreamController
  //     loveController.add(selectedLove!);
  //   }
  // }



  @override
  void dispose() {
    //loveController.close(); // Close the StreamController to prevent memory leaks
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
     final selectedLoveP = ref.read(selectedLoveProvider.notifier).state;
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
                  backgroundImage: AssetImage(getCharacterImage(widget.selectedLove, widget.story.emotion)
                  
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
                    //selectedLove.name ?? "sjksh",
                    "Alex",
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
