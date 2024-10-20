import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roadmap_game/models/character.dart';
import 'package:roadmap_game/models/story.dart';
import 'package:roadmap_game/providers/main_provider.dart';
import 'package:roadmap_game/providers/providers.dart';
import 'package:roadmap_game/screens/character_picker/character_picker.dart';
import 'package:roadmap_game/screens/game/game_view.dart';
import 'package:roadmap_game/screens/game/widgets/home_button.dart';
import 'package:roadmap_game/screens/levels/widget/level_buttons.dart';
import 'package:roadmap_game/screens/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelView extends ConsumerStatefulWidget {
  const LevelView({super.key});

  @override
  ConsumerState<LevelView> createState() => _LevelViewState();
}

class _LevelViewState extends ConsumerState<LevelView> {

  Character? _selectedCharacter;
  SharedPreferences? _prefs;
  int _currentLevelIndex = 0;

  

   @override
  void initState() {
    super.initState();
    characterController = ref.read(characterControllerProvider);
    _prefs = ref.read(sharedPreferenceProvider);
    _loadSelectedCharacter();
   // _loadLevelAndGameplay();

    // Listen for character changes
    characterController.stream.listen((Character? newCharacter) {
      if (newCharacter != null) {
        setState(() {
          _selectedCharacter = newCharacter;
        });
      }
    });
  }


  Future<void> _loadSelectedCharacter() async {
    final characterJson = _prefs?.getString('character');
    if (characterJson != null) {
      final characterMap = jsonDecode(characterJson) as Map<String, dynamic>;
      setState(() {
        _selectedCharacter = Character.fromMap(characterMap);
      });
    }
  }

  void _initializeSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    await _loadSelectedCharacter();
  }

  // Future<void> _loadSelectedCharacter() async {
  //   final characterJson = _prefs?.getString('character');
  //   if (characterJson != null) {
  //     final characterMap = jsonDecode(characterJson) as Map<String, dynamic>;
  //     setState(() {
  //       _selectedCharacter = Character.fromMap(characterMap);
  //     });
  //   }
  // }


  @override
  Widget build(BuildContext context) {
  final level = ref.watch(levelProvider);
  final gameplay = ref.watch(gameplayProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
                        child: BackArrowButton(),
                        //color: Colors.white,
                      ),
                      Spacer(),
                      Text('Level: $level'),
                Text(' Gameplay: $gameplay'),
                      Spacer(),
                      GestureDetector(
                        //icon: Icon(Icons.home),
                        onTap: () {
                         Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CharacterPicker(true)
                    ),
                  );
                        },
                        child: PersonButton(),
                        //color: Colors.white,
                      ),
                      SizedBox(width: 6,),
                      GestureDetector(
                        //icon: Icon(Icons.home),
                        onTap: () {
                         Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Settings()
                    ),
                  );
                          
                        },
                        child: SettingsButton(),
                        //color: Colors.white,
                      ),
                    ],
                  ),
                ),


                Spacer(),

                

    CarouselSlider.builder(
      itemCount: GameLevels.levels.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        // Check if the current page is the center page
        bool isCurrentPage = _currentLevelIndex == index;
        
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300), // Smooth transition
                width: MediaQuery.of(context).size.width,
                height: isCurrentPage
                    ? MediaQuery.of(context).size.height * 0.55 // Larger for center page
                    : MediaQuery.of(context).size.height * 0.45, // Smaller for non-center pages
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  image: DecorationImage(
                    image: AssetImage(GameLevels.levels[index].image), // Level's image
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withOpacity(0.6),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          GameLevels.levels[index].title,
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Text(
                GameLevels.levels[index].description,
                style: TextStyle(fontSize: 12),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 24,),



              Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: GestureDetector(
          onTap:(index + 1 != level) 
              ? null // Disable if no character is selected
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameView(
                        mainCharacter: _selectedCharacter!,
                        level: GameLevels.levels[_currentLevelIndex], currentGamePlay: gameplay,
                      ),
                    ),
                  );
                },
          child: Container(
            decoration: BoxDecoration(
              color: (index + 1 > level)
                  ? Colors.grey
                  : Colors.pink[300], // Grey out if no character is selected
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Center(
                child: Text(

                  (index + 1 > level) ? "🔒 Locked" : (index + 1 == level) ?
                  "Play" : "Completed",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.75,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          setState(() {
            _currentLevelIndex = index;
          });
        },
      ),
    ),

   
Spacer(),
           
          ],
        ),
      ),
    );
  }
}
