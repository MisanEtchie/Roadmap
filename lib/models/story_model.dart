
import 'package:flutter/material.dart';
import 'package:roadmap_game/models/character.dart';

enum StoryBackground { bg1, bg2, bg3, bg4, bg5, bg6, bg7, bg8, bg9, bg10, bg11, bg12 }
enum StoryType { TypeOneCard, TypeTwoCard, TypeThreeCard, TypePickerCard, TypeLoveCard, TypeLovePickerCard}
enum Emotion { Default, Shocked, Happy }

class StoryBackgroundHelper {
  static String getBackgroundImage(StoryBackground bg) {
    switch (bg) {
      case StoryBackground.bg1:
        return 'assets/images/bg1.jpg';
      case StoryBackground.bg2:
        return 'assets/images/bg2.png';
      case StoryBackground.bg3:
        return 'assets/images/bg3.jpg';
        case StoryBackground.bg4:
        return 'assets/images/bg4.jpg';
      case StoryBackground.bg5:
        return 'assets/images/bg5.jpg';
      case StoryBackground.bg6:
        return 'assets/images/bg6.jpg';
      case StoryBackground.bg7:
        return 'assets/images/bg7.jpg';
      case StoryBackground.bg8:
        return 'assets/images/bg8.jpg';
      case StoryBackground.bg9:
        return 'assets/images/bg9.jpg';
      case StoryBackground.bg10:
        return 'assets/images/bg10.jpg';
      case StoryBackground.bg11:
        return 'assets/images/bg11.jpg';
      case StoryBackground.bg12:
        return 'assets/images/bg12.jpg';
      default:
        return 'assets/images/default.jpg'; // Fallback image
    }
  }
}

class Level {
  final String title; // Level title
  final String id; // Level ID
  final String image; // Level image path
  final String description; // Level description
  final List<Story> stories; // List of stories in this level

  Level({
    required this.title,
    required this.id,
    required this.image,
    required this.description,
    required this.stories,
  });
}

class Story {
  final String id; // Unique ID using timestamp
  final StoryBackground? bg; // Nullable background
  final StoryType type;
  final Emotion emotion;
  final Character? speaker;
  final String title;
  final bool multipleOption;
  final List<Map<String, int>> choices; // List of string-int pairs

  Story({
    String? id,
    required this.bg,
    required this.type,
    required this.emotion,
    required this.speaker,
    required this.title,
    required this.multipleOption,
    required this.choices,
  }) : id = id ?? UniqueKey().toString();
}