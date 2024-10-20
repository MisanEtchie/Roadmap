import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roadmap_game/models/character.dart';
import 'package:roadmap_game/models/story_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final selectedLoveProvider = StateProvider<Character?>((ref) => null);

// StreamController Provider (if needed elsewhere)
final loveControllerProvider = Provider<StreamController<Character?>>((ref) {
  return StreamController<Character?>.broadcast();
});

// SharedPreferences Provider


class GameLevels {
  static List<Level> levels = [
    Level(
      title: "Level 1: The Breakdown",
      id: "level1",
      image: 'assets/images/bg1.jpg',
      description:
          "Stranded on a desolate road after a car breakdown, you face survival challenges and uncover eerie landscape mysteries.",
      stories: [
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeOneCard,
          emotion: Emotion.Shocked,
          speaker: null,
          title:
              "Your car has broken down on a winding road in the middle of nowhere with no cell phone reception",
          multipleOption: false,
          choices: [
            {"Next": 1},
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeTwoCard,
          emotion: Emotion.Shocked,
          speaker: null,
          title: "#%@!, Not again",
          multipleOption: true,
          choices: [
            {"Give Up": 3},
            {"Continue fixing it": 2},
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeOneCard,
          emotion: Emotion.Shocked,
          speaker: null,
          title:
              "Your car once again seems not to start. After a growling sound, you realize it's no use",
          multipleOption: false,
          choices: [
            {"Next": 3},
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeOneCard,
          emotion: Emotion.Shocked,
          speaker: null,
          title:
              "Realizing your car won't start anytime soon, you decide to hitchhike \n \nAfter just a few minutes, a seemingly drunk couple in a car pulls up",
          multipleOption: false,
          choices: [
            {"Next": 4},
          ],
        ),
        //catapult
        


        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeTwoCard,
          emotion: Emotion.Happy,
          speaker: null,
          title: "Yes!",
          multipleOption: false,
          choices: [
            {"Next": 5},
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeThreeCard,
          emotion: Emotion.Default,
          speaker: swCharacter,
          title:
              "What is someone like you doing out here alone? \n \n They're a lot of bad people out here... murderers and all",
          multipleOption: false,
          choices: [
            {"Next": 6}
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeThreeCard,
          emotion: Emotion.Default,
          speaker: smCharacter,
          title: "Dawg, you better find a way out of here before dark",
          multipleOption: true,
          choices: [
            {"Ignore them": 7},
            {"See if he can be of any help": 9}
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeTwoCard,
          emotion: Emotion.Shocked,
          speaker: null,
          title: "...",
          multipleOption: false,
          choices: [
            {"Next": 8}
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeThreeCard,
          emotion: Emotion.Default,
          speaker: swCharacter,
          title: "Rude!",
          multipleOption: false,
          choices: [
            {"Next": 10}
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeTwoCard,
          emotion: Emotion.Default,
          speaker: null,
          title: "Can I get a ride to the nearest town?",
          multipleOption: false,
          choices: [
            {"Next": 11}
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeThreeCard,
          emotion: Emotion.Default,
          speaker: smCharacter,
          title: "Soothe yourself",
          multipleOption: false,
          choices: [
            {"Next": 13}
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeThreeCard,
          emotion: Emotion.Default,
          speaker: smCharacter,
          title:
              "Hell naw! How do I know you're not one of them? Can't risk that",
          multipleOption: false,
          choices: [
            {"Next": 12}
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeThreeCard,
          emotion: Emotion.Default,
          speaker: swCharacter,
          title: "HAHAHAHAHA",
          multipleOption: false,
          choices: [
            {"Next": 13}
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeOneCard,
          emotion: Emotion.Default,
          speaker: null,
          title: "They zoom off, with his warning ringing in your head",
          multipleOption: false,
          choices: [
            {"Next": 14}
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeOneCard,
          emotion: Emotion.Default,
          speaker: null,
          title:
              "After what seems like an eternity and a million cars later, a rusty pickup truck rumbles to a stop next to you. \n \nA man with a wide brimmed hat with soulless eyes opens the passenger door for you",
          multipleOption: false,
          choices: [
            {"Next": 15}
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeTwoCard,
          emotion: Emotion.Happy,
          speaker: null,
          title: "Finally!",
          multipleOption: false,
          choices: [
            {"Next": 16}
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeThreeCard,
          emotion: Emotion.Default,
          speaker: omCharacter,
          title: "Need a ride?",
          multipleOption: true,
          choices: [
            {"I'll hop in. Thanks for the help!": 19},
            {"Better ask him if he's a murderer first.": 17}
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeTwoCard,
          emotion: Emotion.Happy,
          speaker: null,
          title: "You're into murdering people, are you? \n \n[nervous laugh]",
          multipleOption: false,
          choices: [
            {"Next": 18}
          ],
        ),
        ///18
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeThreeCard,
          emotion: Emotion.Default,
          speaker: omCharacter,
          title: "Yes, you must be a psychic or something!",
          multipleOption: true,
          choices: [
            {"At least he's honest. I'll climb in.": 19},
            {"Whew. Guess I should count on my luck then": 19}
          ],
        ),
        Story(
          bg: StoryBackground.bg2,
          type: StoryType.TypeTwoCard,
          emotion: Emotion.Default,
          speaker: null,
          title: "Thanks!",
          multipleOption: false,
          choices: [
            {"Next": 21}
          ],
        ),
        Story(
          bg: StoryBackground.bg1,
          type: StoryType.TypeOneCard,
          emotion: Emotion.Default,
          speaker: null,
          title:
              "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
          multipleOption: false,
          choices: [
            {"THE END": 0}
          ],
        ),
        Story(
          bg: StoryBackground.bg2,
          type: StoryType.TypeOneCard,
          emotion: Emotion.Default,
          speaker: null,
          title:
              "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute",
          multipleOption: false,
          choices: [
            {"Next": 22}
          ],
        ),
        Story(
          bg: StoryBackground.bg2,
          type: StoryType.TypeThreeCard,
          emotion: Emotion.Default,
          speaker: omCharacter,
          title:
              "We should lighten up the mood, I have Taylor Swift's Midnight Album Cassette in there",
          multipleOption: false,
          choices: [
            {"Sure thing!": 23}
          ],
        ),
        Story(
          bg: StoryBackground.bg2,
          type: StoryType.TypeOneCard,
          emotion: Emotion.Default,
          speaker: null,
          title:
              "Inside you find a bloody knife, two severed fingers, and a cassette tape of Taylor Swift. He reaches for the glove box.",
          multipleOption: false,
          choices: [
            {"Next": 24}
          ],
        ),
        Story(
          bg: StoryBackground.bg2,
          type: StoryType.TypePickerCard,
          emotion: Emotion.Default,
          speaker: omCharacter,
          title: "Do you hand him the cassette or stab him to save yourself",
          multipleOption: true,
          choices: [
            {"assets/images/cassette.png": 25},
            {"assets/images/knife.png": 32}
          ],
        ),
        Story(
          bg: StoryBackground.bg2,
          type: StoryType.TypeOneCard,
          emotion: Emotion.Default,
          speaker: null,
          title:
              "You bond with the creepy old man while crooning verses of 'Midnight Rain'.",
          multipleOption: false,
          choices: [
            {"Next": 26}
          ],
        ),
        Story(
          bg: StoryBackground.bg3,
          type: StoryType.TypeOneCard,
          emotion: Emotion.Default,
          speaker: null,
          title:
              "He drops you off at the next town. Before you go he turns to you",
          multipleOption: false,
          choices: [
            {"Next": 27}
          ],
        ),
        Story(
          bg: StoryBackground.bg3,
          type: StoryType.TypeThreeCard,
          emotion: Emotion.Default,
          speaker: omCharacter,
          title: "Do you know any good places to dump bodies?",
          multipleOption: false,
          choices: [
            {"Next": 28}
          ],
        ),
        Story(
          bg: StoryBackground.bg3,
          type: StoryType.TypeTwoCard,
          emotion: Emotion.Default,
          speaker: null,
          title: "Try the pier",
          multipleOption: false,
          choices: [
            {"Next": 29}
          ],
        ),
        Story(
          bg: StoryBackground.bg3,
          type: StoryType.TypeThreeCard,
          emotion: Emotion.Default,
          speaker: omCharacter,
          title: "Thanks!",
          multipleOption: false,
          choices: [
            {"Next": 30}
          ],
        ),
        Story(
          bg: StoryBackground.bg3,
          type: StoryType.TypeThreeCard,
          emotion: Emotion.Default,
          speaker: omCharacter,
          title: "You're one of the lucky ones",
          multipleOption: false,
          choices: [
            {"Next": 31}
          ],
        ),
        Story(
          bg: StoryBackground.bg3,
          type: StoryType.TypeOneCard,
          emotion: Emotion.Default,
          speaker: null,
          title: "He zooms off",
          multipleOption: false,
          choices: [
            {"THE END": 0}
          ],
        ),
        Story(
          bg: StoryBackground.bg2,
          type: StoryType.TypeOneCard,
          emotion: Emotion.Default,
          speaker: null,
          title:
              "As you smash through the guardrail and careen towards the jagged rocks below, you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
          multipleOption: false,
          choices: [
            {"Next": 33}
          ],
        ),
        Story(
          bg: StoryBackground.bg2,
          type: StoryType.TypeOneCard,
          emotion: Emotion.Default,
          speaker: null,
          title: "You wake up from your vivid day dream and hand him the cassette.",
          multipleOption: false,
          choices: [
            {"Next": 25}
          ],
        ),
        //catapult
        Story(
          bg: StoryBackground.bg2,
          type: StoryType.TypeTwoCard,
          emotion: Emotion.Shocked,
          speaker: null,
          title: "Well, that was stupid...",
          multipleOption: false,
          choices: [
            {"Next": 34}
          ],
        ),
        Story(
          bg: StoryBackground.bg2,
          type: StoryType.TypeOneCard,
          emotion: Emotion.Default,
          speaker: null,
          title: "You crash into rocks and go unconscious.",
          multipleOption: false,
          choices: [
            {"THE END": 0}
          ],
        ),
      ],
    ),
    Level(
        title: "Level 2: Murder at The Manor",
        id: "level2",
        image: 'assets/images/bg4.jpg',
        description:
         "Stepping into the grand Bredessen mansion. Tonight, amidst unfamiliar faces and unspoken secrets, the shadows conceal a looming tragedy.",
         stories: [
       Story(
    bg: StoryBackground.bg3,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You arrive at the imposing Bredessen mansion, its gothic architecture casting long shadows in the fading daylight.",
    multipleOption: false,
    choices: [
      {"Continue": 1}
    ],
  ),

  // Story 1: Decision to Approach or Explore
  Story(
    bg: StoryBackground.bg4,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "A sense of unease settles over you. Do you approach the front door or explore the grounds first?",
    multipleOption: true,
    choices: [
      {"Approach the door": 2},
      {"Explore the grounds": 10}
    ],
  ),

  // Story 2: Approaching the Door
  Story(
    bg: StoryBackground.bg4,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You walk up the stone steps to the massive wooden door and knock. The door creaks open.",
    multipleOption: false,
    choices: [
      {"Continue": 3}
    ],
  ),

  // Story 3: Mr. Bredessen Greets You
  Story(
    bg: StoryBackground.bg4,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "A tall man with a stern expression stands before you.",
    multipleOption: false,
    choices: [
      {"Continue": 4}
    ],
  ),

  // Story 4: Mr. Bredessen Speaks
  Story(
    bg: StoryBackground.bg4,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Default,
    speaker: bredmCharacter,
    title:
        "Welcome to our home. Please, come in.",
    multipleOption: true,
    choices: [
      {"Thank him": 5},
      {"Remain silent": 6}
    ],
  ),

  // Story 5: You Thank Him
  Story(
    bg: StoryBackground.bg4,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Happy,
    speaker: null,
    title:
        "Thank you for having me.",
    multipleOption: false,
    choices: [
      {"Continue": 7}
    ],
  ),

  // Story 6: You Remain Silent
  Story(
    bg: StoryBackground.bg4,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "...",
    multipleOption: false,
    choices: [
      {"Continue": 7}
    ],
  ),

  // Story 7: Entering the Mansion
  Story(
    bg: StoryBackground.bg11,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You step inside, and the door closes behind you with a heavy thud.",
    multipleOption: false,
    choices: [
      {"Continue": 8}
    ],
  ),

  // Story 8: Mrs. Bredessen Appears
  Story(
    bg: StoryBackground.bg11,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "A graceful woman descends the grand staircase, her eyes warm but cautious.",
    multipleOption: false,
    choices: [
      {"Continue": 9}
    ],
  ),

  // Story 9: Mrs. Bredessen Greets You
  Story(
    bg: StoryBackground.bg11,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Happy,
    speaker: bredwCharacter,
    title:
        "It's wonderful to meet you at last.",
    multipleOption: true,
    choices: [
      {"Greet her warmly": 11},
      {"Nod politely": 12}
    ],
  ),

  // Story 10: Exploring the Grounds
  Story(
    bg: StoryBackground.bg6,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You decide to explore the overgrown gardens, where twisted statues loom.",
    multipleOption: false,
    choices: [
      {"Continue": 13}
    ],
  ),

  // Story 11: You Greet Mrs. Bredessen Warmly
  Story(
    bg: StoryBackground.bg6,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Happy,
    speaker: null,
    title:
        "The pleasure is all mine.",
    multipleOption: false,
    choices: [
      {"Continue": 14}
    ],
  ),

  // Story 12: You Nod Politely
  Story(
    bg: StoryBackground.bg11,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Thank you.",
    multipleOption: false,
    choices: [
      {"Continue": 14}
    ],
  ),

  // Story 13: Return to the Mansion
  Story(
    bg: StoryBackground.bg6,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "As the sun sets, you decide to head inside the mansion.",
    multipleOption: false,
    choices: [
      {"Continue": 3} // Leads back to Mr. Bredessen greeting you
    ],
  ),

  // Story 14: Tension in the Air
  Story(
    bg: StoryBackground.bg11,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You sense an unspoken tension between Mr. and Mrs. Bredessen.",
    multipleOption: true,
    choices: [
      {"Ask about it": 15},
      {"Ignore it": 16}
    ],
  ),

  // Story 15: You Ask About the Tension
  Story(
    bg: StoryBackground.bg11,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Is everything alright?",
    multipleOption: false,
    choices: [
      {"Continue": 17}
    ],
  ),

  // Story 16: You Ignore the Tension
  Story(
    bg: StoryBackground.bg11,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You decide it's best not to pry.",
    multipleOption: false,
    choices: [
      {"Continue": 18}
    ],
  ),

  // Story 17: Mrs. Bredessen's Response
  Story(
    bg: StoryBackground.bg11,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Shocked,
    speaker: bredwCharacter,
    title:
        "Oh, it's nothing. Just the stress of managing the estate.",
    multipleOption: false,
    choices: [
      {"Continue": 18}
    ],
  ),

  // Story 18: Mr. Bredessen Invites You to Dinner
  Story(
    bg: StoryBackground.bg11,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Default,
    speaker: bredmCharacter,
    title:
        "Please, join us for dinner.",
    multipleOption: false,
    choices: [
      {"Accept the invitation": 19}
    ],
  ),

  // Story 19: Dinner Time
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "At dinner, the atmosphere is heavy. The long table is set elegantly.",
    multipleOption: false,
    choices: [
      {"Continue": 20}
    ],
  ),

  // Story 20: Meeting Other Guests
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You are introduced to James, a distant relative; Mia, a family friend; and Damian, a mysterious figure.",
    multipleOption: false,
    choices: [
      {"Continue": 21}
    ],
  ),

  // Story 21: Damian Speaks to You
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Default,
    speaker: damCharacter,
    title:
        "So, what brings you to our humble abode?",
    multipleOption: true,
    choices: [
      {"Answer politely": 22},
      {"Be cautious": 23}
    ],
  ),

  // Story 22: You Answer Damian Politely
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Just visiting and enjoying the hospitality.",
    multipleOption: false,
    choices: [
      {"Continue": 24}
    ],
  ),

  // Story 23: You Are Cautious with Damian
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "I'd prefer not to discuss personal matters.",
    multipleOption: false,
    choices: [
      {"Continue": 24}
    ],
  ),

  // Story 24: Damian's Reaction
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Default,
    speaker: damCharacter,
    title:
        "Fair enough. This place does have its charms.",
    multipleOption: false,
    choices: [
      {"Continue": 25}
    ],
  ),

  // Story 25: James Joins the Conversation
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Happy,
    speaker: jamesCharacter,
    title:
        "If you need anything during your stay, feel free to ask.",
    multipleOption: true,
    choices: [
      {"Thank James": 26},
      {"Ask about James": 27}
    ],
  ),

  // Story 26: You Thank James
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Happy,
    speaker: null,
    title:
        "Thank you, I appreciate that.",
    multipleOption: false,
    choices: [
      {"Continue": 28}
    ],
  ),

  // Story 27: You Ask About James
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "So, how are you connected to the Bredessens?",
    multipleOption: false,
    choices: [
      {"Continue": 28}
    ],
  ),

  // Story 28: James's Response
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Default,
    speaker: jamesCharacter,
    title:
        "I'm a distant cousin, visiting to discuss some... family matters.",
    multipleOption: false,
    choices: [
      {"Continue": 29}
    ],
  ),

  // Story 29: You Notice James's Unease
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You notice a hint of frustration in James's eyes.",
    multipleOption: true,
    choices: [
      {"Inquire further": 30},
      {"Let it go": 31}
    ],
  ),

  // Story 30: You Inquire Further About James
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Is everything alright? You seem troubled.",
    multipleOption: false,
    choices: [
      {"Continue": 32}
    ],
  ),

  // Story 31: You Let It Go
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You decide not to press the matter.",
    multipleOption: false,
    choices: [
      {"Continue": 36}
    ],
  ),

  // Story 32: James Opens Up
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Shocked,
    speaker: jamesCharacter,
    title:
        "Honestly, things have been tough. I'm hoping Mr. Bredessen can help me with a business opportunity.",
    multipleOption: false,
    choices: [
      {"Continue": 33}
    ],
  ),

  // Story 33: You Offer Support
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Happy,
    speaker: null,
    title:
        "I hope it works out for you.",
    multipleOption: false,
    choices: [
      {"Continue": 34}
    ],
  ),

  // Story 34: James's Appreciation
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Happy,
    speaker: jamesCharacter,
    title:
        "Thank you. That means a lot.",
    multipleOption: false,
    choices: [
      {"Continue": 35}
    ],
  ),

  // Story 35: Mr. Bredessen Observes
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You notice Mr. Bredessen glancing disapprovingly in James's direction.",
    multipleOption: false,
    choices: [
      {"Continue": 36}
    ],
  ),

  // Story 36: Mia Speaks Up
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Happy,
    speaker: miaCharacter,
    title:
        "Perhaps we can explore some of the mansion's secrets together.",
    multipleOption: true,
    choices: [
      {"Agree to explore": 37},
      {"Express hesitation": 38}
    ],
  ),

  // Story 37: You Agree to Explore with Mia
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Happy,
    speaker: null,
    title:
        "That sounds intriguing.",
    multipleOption: false,
    choices: [
      {"Continue": 39}
    ],
  ),

  // Story 38: You Express Hesitation
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Maybe another time.",
    multipleOption: false,
    choices: [
      {"Continue": 39}
    ],
  ),

  // Story 39: Dinner Continues
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "The conversation flows, but the tension between James and Mr. Bredessen is palpable.",
    multipleOption: false,
    choices: [
      {"Continue": 40}
    ],
  ),

  // Story 40: Mr. Bredessen Makes a Toast
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Default,
    speaker: bredmCharacter,
    title:
        "To family and prosperity.",
    multipleOption: false,
    choices: [
      {"Raise your glass": 41}
    ],
  ),

  // Story 41: You Raise Your Glass
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Happy,
    speaker: null,
    title:
        "Cheers.",
    multipleOption: false,
    choices: [
      {"Continue": 42}
    ],
  ),

  // Story 42: After Dinner
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Dinner concludes, and the guests begin to disperse.",
    multipleOption: false,
    choices: [
      {"Continue": 43}
    ],
  ),

  // Story 43: Mrs. Bredessen Approaches You
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Default,
    speaker: bredwCharacter,
    title:
        "I hope you're finding everything to your liking.",
    multipleOption: true,
    choices: [
      {"Express gratitude": 44},
      {"Mention the tension": 45}
    ],
  ),

  // Story 44: You Express Gratitude
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Happy,
    speaker: null,
    title:
        "Yes, thank you for your hospitality.",
    multipleOption: false,
    choices: [
      {"Continue": 46}
    ],
  ),

  // Story 45: You Mention the Tension Again
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "There seems to be some tension here. Is everything okay?",
    multipleOption: false,
    choices: [
      {"Continue": 47}
    ],
  ),

  // Story 46: Mrs. Bredessen's Response
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Happy,
    speaker: bredwCharacter,
    title:
        "I'm glad to hear that. Please make yourself at home.",
    multipleOption: false,
    choices: [
      {"Continue": 48}
    ],
  ),

  // Story 47: Mrs. Bredessen's Hesitation
  Story(
    bg: StoryBackground.bg8,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Shocked,
    speaker: bredwCharacter,
    title:
        "It's nothing to worry about. Just family matters...",
    multipleOption: false,
    choices: [
      {"Continue": 48}
    ],
  ),

  // Story 48: Heading to Your Room
  Story(
    bg: StoryBackground.bg7,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Feeling a bit overwhelmed, you decide to go upstairs to your bedroom for a while.",
    multipleOption: false,
    choices: [
      {"Continue": 49}
    ],
  ),

  // Story 49: In Your Room
  Story(
    bg: StoryBackground.bg7,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "The room is spacious yet feels strangely claustrophobic. You reflect on the evening's events.",
    multipleOption: true,
    choices: [
      {"Rest for a bit": 50},
      {"Explore the room": 51}
    ],
  ),

  // Story 50: Resting
  Story(
    bg: StoryBackground.bg7,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You sit on the bed, feeling the weight of the day's journey.",
    multipleOption: false,
    choices: [
      {"Continue": 52} 
    ],
  ),

  // Story 51: Exploring the Room
  Story(
    bg: StoryBackground.bg7,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You notice an old painting on the wall and a bookshelf filled with dusty tomes.",
    multipleOption: false,
    choices: [
      {"Examine the painting": 53},
      {"Browse the books": 54}
    ],
  ),

  // Story 52: Hearing a Scream
  Story(
    bg: StoryBackground.bg7,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Shocked,
    speaker: null,
    title:
        "Suddenly, a piercing scream echoes through the mansion.",
    multipleOption: false,
    choices: [
      {"React": 55}
    ],
  ),

  // Story 53: Examining the Painting
  Story(
    bg: StoryBackground.bg7,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "The painting depicts the mansion in its early days. There's something unsettling about it.",
    multipleOption: false,
    choices: [
      {"Continue": 52} // Leads to hearing the scream
    ],
  ),

  // Story 54: Browsing the Books
  Story(
    bg: StoryBackground.bg7,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You pull out an old journal, but before you can open it, a scream pierces the air.",
    multipleOption: false,
    choices: [
      {"React": 55}
    ],
  ),

  //
  //

  Story(
    bg: StoryBackground.bg9,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Shocked,
    speaker: bredwCharacter,
    title:
        "AHHHHH!",
    multipleOption: false,
    choices: [
      {"Continue": 56}
    ],
  ),

  //

  // Story 55: Reacting to the Scream
  Story(
  bg: StoryBackground.bg7,
  type: StoryType.TypeTwoCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "What was that?",
  multipleOption: false,
  choices: [
    {"Rush downstairs": 57} // 56 + 4 = 60
  ],
),

// Story 57: Rushing to the Source
Story(
  bg: StoryBackground.bg10,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "You sprint down the hallway, joining others converging towards the main hall.",
  multipleOption: false,
  choices: [
    {"Continue": 58} // 57 + 4 = 61
  ],
),

// Story 58: Seeing Mrs. Bredessen
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "Mrs. Bredessen stands at the bottom of the grand staircase, her face pale.",
  multipleOption: false,
  choices: [
    {"Continue": 59} // 58 + 4 = 62
  ],
),

// Story 59: Mrs. Bredessen's Cry
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Shocked,
  speaker: bredwCharacter,
  title:
      "He's dead!",
  multipleOption: false,
  choices: [
    {"Continue": 60} // 59 + 4 = 63
  ],
),

// Story 60: Discovering the Body
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "At the foot of the stairs lies Mr. Bredessen, motionless.",
  multipleOption: false,
  choices: [
    {"Continue": 61} // 60 + 4 = 64
  ],
),

// Story 61: Others React
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "James, Mia, and Damian arrive, shock evident on their faces.",
  multipleOption: false,
  choices: [
    {"Continue": 62} // 61 + 4 = 65
  ],
),

// Story 62: James's Shock
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Shocked,
  speaker: jamesCharacter,
  title:
      "This can't be happening...",
  multipleOption: false,
  choices: [
    {"Continue": 63} // 62 + 4 = 66
  ],
),

// Story 63: Suspicion Arises
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "You recall the tension between James and Mr. Bredessen.",
  multipleOption: true,
  choices: [
    {"Confront James": 64}, // 63 + 4 = 67
    {"Stay silent": 67}     // 66 + 4 = 70
  ],
),

// Story 64: You Confront James
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeTwoCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "Is there something you want to tell us, James?",
  multipleOption: false,
  choices: [
    {"Continue": 65} // 64 + 4 = 68
  ],
),

// Story 65: James's Defense
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Shocked,
  speaker: jamesCharacter,
  title:
      "What are you implying? I had nothing to do with this!",
  multipleOption: false,
  choices: [
    {"Continue": 66} // 65 + 4 = 69
  ],
),

// Story 66: Tension Among the Group
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "The atmosphere grows increasingly tense as suspicion spreads.",
  multipleOption: false,
  choices: [
    {"Continue": 68} // 67 + 4 = 71
  ],
),

// Story 67: You Stay Silent
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You decide it's not the time to point fingers.",
  multipleOption: false,
  choices: [
    {"Continue": 68} // 67 + 4 = 71
  ],
),

// Story 68: Damian Speaks
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Default,
  speaker: damCharacter,
  title:
      "We should call the authorities.",
  multipleOption: false,
  choices: [
    {"Continue": 69} // 68 + 4 = 72
  ],
),

// Story 69: Mrs. Bredessen's Despair
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Shocked,
  speaker: bredwCharacter,
  title:
      "I can't believe he's gone...",
  multipleOption: false,
  choices: [
    {"Comfort her": 70}, // 69 + 4 = 73
    {"Say nothing": 71}  // 70 + 4 = 74
  ],
),

// Story 70: You Comfort Mrs. Bredessen
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeTwoCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "I'm so sorry for your loss.",
  multipleOption: false,
  choices: [
    {"Continue": 72} // 71 + 4 = 75
  ],
),

// Story 71: You Say Nothing
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You remain silent, unsure of what to say.",
  multipleOption: false,
  choices: [
    {"Continue": 72} // 71 + 4 = 75
  ],
),

// Story 72: The Mystery Remains
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "As the night wears on, the mystery deepens. No one knows what truly happened.",
  multipleOption: false,
  choices: [
    {"Continue": 73} // 72 + 4 = 76
  ],
),

// Story 73: The Story Ends
Story(
  bg: StoryBackground.bg9,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "The events leave more questions than answers, and the mansion's shadows grow ever darker.",
  multipleOption: false,
  choices: [
    {"THE END": 0}
  ],
),
        ]),
    
    
    //
    ///
    /////
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    Level(
        title: "Level 3: Clues, Use and Misuse",
        id: "level3",
        image: 'assets/images/bg10.jpg',
        description:
            "Stranded on a desolate road after a car breakdown, players must navigate challenges and make crucial choices to survive while uncovering the mysteries of the eerie landscape.",
        stories: [
         
         
         
         Story(
          
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "As dawn breaks over the Bredessen mansion, the chilling events of the night before linger in your mind.",
    multipleOption: false,
    choices: [
      {"Continue": 1}
    ],
  ),

  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Shocked,
    speaker: null,
    title:
        "...",
    multipleOption: false,
    choices: [
      {"Continue": 2}
    ],
  ),

  // Story 2: Decision to Investigate
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Determined to uncover the truth behind Mr. Bredessen's death, you decide to investigate.",
    multipleOption: true,
    choices: [
      {"Examine the crime scene": 3},
      
      {"Talk to the other guests": 9}
    ],
  ),

  // Story 3: Examining the Crime Scene
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You return to the grand staircase where Mr. Bredessen was found.",
    multipleOption: false,
    choices: [
      {"Continue": 4}
    ],
  ),

  // Story 4: Observing the Surroundings
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "The area is cordoned off, but no authorities have arrived yet.",
    multipleOption: false,
    choices: [
      {"Continue": 5}
    ],
  ),

  // Story 5: Noticing a Clue
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Shocked,
    speaker: null,
    title:
        "You spot a torn piece of fabric caught on the banister.",
    multipleOption: true,
    choices: [
      {"Examine the fabric": 6},
      {"Leave it untouched": 8}
    ],
  ),

  // Story 6: Examining the Fabric
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "The fabric is dark and silky, possibly from a suit.",
    multipleOption: false,
    choices: [
      {"Pocket the fabric": 7}
    ],
  ),

  // Story 7: You Keep the Fabric
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You discreetly place the fabric in your pocket for later examination.",
    multipleOption: false,
    choices: [
      {"Continue": 8}
    ],
  ),

  // Story 8: Leaving the Fabric
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You decide not to disturb the potential evidence.",
    multipleOption: false,
    choices: [
      {"Continue": 9}
    ],
  ),

  // Story 9: Hearing Footsteps
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You hear footsteps approaching. Someone is coming.",
    multipleOption: false,
    choices: [
      {"Continue": 10}
    ],
  ),

  // Story 10: Damian Appears
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Default,
    speaker: damCharacter,
    title:
        "Snooping around, are we?",
    multipleOption: true,
    choices: [
      {"Continue": 11}
      //{"Deflect": 11}
    ],
  ),

  // Story 11: Talking to the Other Guests
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You decide to ignore him and gather information by speaking with the other guests.",
    multipleOption: false,
    choices: [
      {"Continue": 12}
    ],
  ),

  // Story 12: Finding Mia
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You find Mia in the library, engrossed in a book.",
    multipleOption: false,
    choices: [
      {"Approach her": 13}
    ],
  ),

  // Story 13: Mia Greets You
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Happy,
    speaker: miaCharacter,
    title:
        "Good morning. Strange night, wasn't it?",
    multipleOption: true,
    choices: [
      {"Agree": 14},
      {"Question her": 16}
    ],
  ),

  // Story 14: You Agree with Mia
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Indeed. I'm still trying to make sense of it.",
    multipleOption: false,
    choices: [
      {"Continue": 15}
    ],
  ),

  

  
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Shocked,
    speaker: miaCharacter,
    title:
        "It's all so unsettling. I hardly slept.",
    multipleOption: false,
    choices: [
      {"Continue": 18}
    ],
  ),

  // Story 16: You Question Mia
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Do you know anything that might help explain what happened?",
    multipleOption: false,
    choices: [
      {"Continue": 17}
    ],
  ),

  // Story 17: Mia's Response to Questioning
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Default,
    speaker: miaCharacter,
    title:
        "I'm not sure. But I feel there's more to this place than meets the eye.",
    multipleOption: false,
    choices: [
      {"Continue": 18}
    ],
  ),








  // Story 18: Noticing Mia's Concern
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You notice a hint of worry in Mia's eyes.",
    multipleOption: true,
    choices: [
      {"Offer support": 19},
      {"Change the subject": 21}
    ],
  ),

  // Story 19: Offering Support to Mia
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Happy,
    speaker: null,
    title:
        "If there's anything I can do, let me know.",
    multipleOption: false,
    choices: [
      {"Continue": 20}
    ],
  ),

  // Story 20: Being Honest with Damian
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Just trying to figure out what happened.",
    multipleOption: false,
    choices: [
      {"Continue": 21}
    ],
  ),

  // Story 21: Changing the Subject with Mia
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "So, how long have you known the Bredessens?",
    multipleOption: false,
    choices: [
      {"Continue": 22}
    ],
  ),

  // Story 22: Mia Appreciates Your Support
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Shocked,
    speaker: miaCharacter,
    title:
        "Thank you. It's comforting to have someone to talk to.",
    multipleOption: false,
    choices: [
      {"Continue": 23}
    ],
  ),

  // Story 23: Changing the Subject with Mia
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "My pleasure.",
    multipleOption: false,
    choices: [
      {"Continue": 24}
    ],
  ),

///
////
///
///
  
  

  // Story 24: Mia Shares More
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Mia seems more at ease now.",
    multipleOption: true,
    choices: [
      //{"Ask about the mansion": 25},
      {"Bid her farewell": 25}
    ],
  ),


  

  // Story 25: Bidding Mia Farewell
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "I'll let you get back to your book. See you later.",
    multipleOption: false,
    choices: [
      {"Continue": 26}
    ],
  ),

  // Story 26: Asking Mia About the Mansion
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Shocked,
    speaker: miaCharacter,
    title:
        "Alright",
    multipleOption: false,
    choices: [
      {"Continue": 27}
    ],
  ),


///
/////
///
///
///
///


  // Story 27: Deciding What to Do Next
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You consider your next move in this unfolding mystery.",
    multipleOption: true,
    choices: [
      {"Seek out James": 28},
      
    ],
  ),

  

  // Story 28: Seeking Out James
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You decide to find James and see what he knows.",
    multipleOption: false,
    choices: [
      {"Continue": 29}
    ],
  ),

  

  // Story 34: Finding James in the Study
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You find James in the study, poring over documents.",
    multipleOption: false,
    choices: [
      {"Approach him": 30}
    ],
  ),

  

//30
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Default,
    speaker: jamesCharacter,
    title:
        "What do you want?",
    multipleOption: true,
    choices: [
      {"Confront him": 31},
      {"Offer assistance": 32}
    ],
  ),

  

  /////////////\\\\ Story 31: Confronting James
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Shocked,
    speaker: null,
    title:
        "I know about your financial troubles. What aren't you telling us?",
    multipleOption: false,
    choices: [
      {"Continue": 33}
    ],
  ),

//32
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You seem troubled. Maybe I can help.",
    multipleOption: false,
    choices: [
      {"Continue": 34}
    ],
  ),

 

  // Story 33
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Shocked,
    speaker: jamesCharacter,
    title:
        "That's none of your business!",
    multipleOption: false,
    choices: [
      {"Continue": 35}
    ],
  ),

  // Story 34
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Default,
    speaker: jamesCharacter,
    title:
        "I doubt you can, but thanks.",
    multipleOption: false,
    choices: [
      {"Continue": 35}
    ],
  ),



//catapult 35
  //35
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "James is clearly upset.",
    multipleOption: true,
    choices: [
      {"Apologize": 48},
      {"Press further": 49}
    ],
  ),

  // Story 45: Ending Conversation with James
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Sensing he won't say more, you decide to leave.",
    multipleOption: false,
    choices: [
      {"Continue": 50}
    ],
  ),

  // Story 46: Entering the Secret Door
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Shocked,
    speaker: null,
    title:
        "You step into a narrow passage lit by dim lanterns.",
    multipleOption: false,
    choices: [
      {"Continue": 51}
    ],
  ),

  // Story 47: [Removed to prevent disjointed narrative]

  // Story 48: Apologizing to James
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Happy,
    speaker: null,
    title:
        "I'm sorry. I didn't mean to pry.",
    multipleOption: false,
    choices: [
      {"Continue": 52}
    ],
  ),

  // Story 49: Pressing James Further
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Shocked,
    speaker: null,
    title:
        "Your reaction says otherwise. What are you hiding?",
    multipleOption: false,
    choices: [
      {"Continue": 52}
    ],
  ),

  // Story 50: Deciding Where to Go Next
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You need to decide your next course of action.",
    multipleOption: true,
    choices: [
      {"Find Mrs. Bredessen": 53},
      {"Rest in your room": 60}
    ],
  ),

  // Story 51: Exploring the Secret Passage
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Shocked,
    speaker: null,
    title:
        "The passage leads to a small room filled with old artifacts.",
    multipleOption: false,
    choices: [
      {"Continue": 54}
    ],
  ),

  // Story 52: James's Outburst
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Shocked,
    speaker: jamesCharacter,
    title:
        "Enough! Leave me alone!",
    multipleOption: false,
    choices: [
      {"Continue": 55}
    ],
  ),

  // Story 53: Finding Mrs. Bredessen
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You find Mrs. Bredessen in the parlor, staring out the window.",
    multipleOption: false,
    choices: [
      {"Approach her": 56}
    ],
  ),

  // Story 54: Discovering a Mysterious Journal
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Shocked,
    speaker: null,
    title:
        "Among the artifacts, you discover a journal with cryptic entries.",
    multipleOption: false,
    choices: [
      {"Read the journal": 57}
    ],
  ),

  // Story 55: Mrs. Bredessen's Grief
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Shocked,
    speaker: bredwCharacter,
    title:
        "I don't know how to go on without him.",
    multipleOption: true,
    choices: [
      {"Offer comfort": 58},
      {"Ask about Mr. Bredessen": 59}
    ],
  ),

  // Story 56: Reading the Journal
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "The journal mentions secret dealings and strained relationships.",
    multipleOption: false,
    choices: [
      {"Continue": 60}
    ],
  ),

  // Story 57: Offering Comfort
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Happy,
    speaker: null,
    title:
        "I'm so sorry for your loss. If there's anything I can do...",
    multipleOption: false,
    choices: [
      {"Continue": 61}
    ],
  ),

  // Story 58: Asking About Mr. Bredessen
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Was there anyone who might have wanted to harm him?",
    multipleOption: false,
    choices: [
      {"Continue": 62}
    ],
  ),

  // Story 59: Gaining Insight
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Shocked,
    speaker: null,
    title:
        "The journal might hold clues to the motive behind his death.",
    multipleOption: false,
    choices: [
      {"Continue": 63}
    ],
  ),

  // Story 60: Resting in Your Room
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Feeling overwhelmed, you decide to rest in your room for a while.",
    multipleOption: false,
    choices: [
      {"Continue": 63}
    ],
  ),

  // Story 61: Mrs. Bredessen's Appreciation
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Happy,
    speaker: bredwCharacter,
    title:
        "Thank you. Your kindness means a lot.",
    multipleOption: false,
    choices: [
      {"Continue": 64}
    ],
  ),

  // Story 62: Mrs. Bredessen's Hesitation
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Shocked,
    speaker: bredwCharacter,
    title:
        "I... I don't know. He had his disagreements, but nothing serious.",
    multipleOption: false,
    choices: [
      {"Continue": 64}
    ],
  ),

  // Story 63: Interrupted Rest
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Shocked,
    speaker: null,
    title:
        "A knock on your door interrupts your rest.",
    multipleOption: false,
    choices: [
      {"Answer the door": 65}
    ],
  ),

  // Story 64: Deciding What to Do Next
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You consider your next move.",
    multipleOption: true,
    choices: [
      {"Search Mr. Bredessen's office": 66},
      {"Speak with Damian": 70}
    ],
  ),

  // Story 65: Mia at the Door
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeThreeCard,
    emotion: Emotion.Happy,
    speaker: miaCharacter,
    title:
        "I thought you might want to explore the passages now.",
    multipleOption: false,
    choices: [
      {"Agree to go": 67},
      {"Decline": 68}
    ],
  ),

  // Story 66: Searching the Office
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You head to Mr. Bredessen's office, hoping to find clues.",
    multipleOption: false,
    choices: [
      {"Continue": 69}
    ],
  ),

  // Story 67: Exploring with Mia
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Happy,
    speaker: null,
    title:
        "You and Mia set off to explore the hidden passages.",
    multipleOption: false,
    choices: [
      {"Continue": 71}
    ],
  ),

  // Story 68: Declining Mia's Offer
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeTwoCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "Maybe later. I need some time alone.",
    multipleOption: false,
    choices: [
      {"Continue": 69}
    ],
  ),

  // Story 69: Inside the Office
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "The office is cluttered with papers and personal items.",
    multipleOption: false,
    choices: [
      {"Search the desk": 72},
      {"Examine the bookshelf": 73}
    ],
  ),

  // Story 70: Speaking with Damian
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Default,
    speaker: null,
    title:
        "You decide to find Damian and see what he knows.",
    multipleOption: false,
    choices: [
      {"Continue": 74}
    ],
  ),

  // Story 71: Entering the Passage with Mia
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Shocked,
    speaker: null,
    title:
        "You enter a dimly lit corridor behind a hidden panel.",
    multipleOption: false,
    choices: [
      {"Continue": 75}
    ],
  ),

  // Story 72: Finding a Hidden Document
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Shocked,
    speaker: null,
    title:
        "In the desk drawer, you find a hidden document.",
    multipleOption: false,
    choices: [
      {"Continue": 76}
    ],
  ),

  // Story 73: Discovering a Secret Compartment
  Story(
    bg: StoryBackground.bg1,
    type: StoryType.TypeOneCard,
    emotion: Emotion.Shocked,
    speaker: null,
    title:
        "Behind a book, a lever reveals a secret compartment.",
    multipleOption: false,
    choices: [
      {"Continue": 77}
    ],
  ),

  // Story 77: Discovering Hidden Documents
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "Inside the compartment, you find old letters addressed to Mr. Bredessen.",
  multipleOption: false,
  choices: [
    {"Continue": 78}
  ],
),

// Story 78: Reading the Letters
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "The letters hint at a family feud and threats from an unknown person.",
  multipleOption: false,
  choices: [
    {"Continue": 79}
  ],
),

// Story 79: Deciding What to Do Next
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You consider sharing this information with someone.",
  multipleOption: true,
  choices: [
    {"Tell Mia": 80},
    {"Keep it to yourself": 81}
  ],
),

// Story 80: Sharing with Mia
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Shocked,
  speaker: miaCharacter,
  title:
      "This is serious. We need to find out who wrote these.",
  multipleOption: false,
  choices: [
    {"Continue": 82}
  ],
),

// Story 81: Keeping the Information Private
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You decide to keep the letters for now.",
  multipleOption: false,
  choices: [
    {"Continue": 83}
  ],
),

// Story 82: Deciding Next Steps with Mia
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "Together, you plan to investigate further.",
  multipleOption: true,
  choices: [
    {"Search for more clues": 84},
    {"Confront Mrs. Bredessen": 85}
  ],
),

// Story 83: Exiting the Office
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You leave the office, pondering your next move.",
  multipleOption: false,
  choices: [
    {"Continue": 86}
  ],
),

// Story 84: Searching for More Clues
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You and Mia decide to search the library for more information.",
  multipleOption: false,
  choices: [
    {"Continue": 87}
  ],
),

// Story 85: Confronting Mrs. Bredessen
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "You approach Mrs. Bredessen with the letters.",
  multipleOption: false,
  choices: [
    {"Continue": 88}
  ],
),

// Story 86: Encountering Damian
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Default,
  speaker: damCharacter,
  title:
      "You look troubled. Found something interesting?",
  multipleOption: true,
  choices: [
    {"Share about the letters": 89},
    {"Keep it vague": 90}
  ],
),

// Story 87: Finding an Old Diary
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "In the library, you discover an old diary belonging to Mr. Bredessen.",
  multipleOption: false,
  choices: [
    {"Continue": 91}
  ],
),

// Story 88: Mrs. Bredessen's Reaction
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Shocked,
  speaker: bredwCharacter,
  title:
      "Where did you find these?",
  multipleOption: true,
  choices: [
    {"Tell the truth": 92},
    {"Avoid answering": 93}
  ],
),

// Story 89: Sharing with Damian
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeTwoCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "I found some letters that might be important.",
  multipleOption: false,
  choices: [
    {"Continue": 94}
  ],
),

// Story 90: Keeping It Vague with Damian
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeTwoCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "Just trying to make sense of everything.",
  multipleOption: false,
  choices: [
    {"Continue": 95}
  ],
),

// Story 91: Reading the Diary
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "The diary details tensions within the family over inheritance.",
  multipleOption: false,
  choices: [
    {"Continue": 96}
  ],
),

// Story 92: Telling Mrs. Bredessen the Truth
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeTwoCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "I found them hidden in Mr. Bredessen's office.",
  multipleOption: false,
  choices: [
    {"Continue": 97}
  ],
),

// Story 93: Avoiding the Question
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeTwoCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "I think that's not important right now.",
  multipleOption: false,
  choices: [
    {"Continue": 98}
  ],
),

// Story 94: Damian's Interest
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Default,
  speaker: damCharacter,
  title:
      "Perhaps we should discuss this somewhere private.",
  multipleOption: false,
  choices: [
    {"Agree": 99}
  ],
),

// Story 95: Damian's Suspicion
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Shocked,
  speaker: damCharacter,
  title:
      "You're hiding something.",
  multipleOption: false,
  choices: [
    {"Continue": 100}
  ],
),

// Story 96: Sharing Findings with Mia
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Shocked,
  speaker: miaCharacter,
  title:
      "This could explain a lot.",
  multipleOption: false,
  choices: [
    {"Continue": 101}
  ],
),

// Story 97: Mrs. Bredessen's Concern
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Shocked,
  speaker: bredwCharacter,
  title:
      "You shouldn't be snooping around.",
  multipleOption: false,
  choices: [
    {"Continue": 102}
  ],
),

// Story 98: Mrs. Bredessen's Frustration
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Shocked,
  speaker: bredwCharacter,
  title:
      "If you're not going to be honest, I can't help you.",
  multipleOption: false,
  choices: [
    {"Continue": 103}
  ],
),

// Story 99: Meeting with Damian
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You follow Damian to a secluded room.",
  multipleOption: false,
  choices: [
    {"Continue": 104}
  ],
),

// Story 100: Deciding How to Respond
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "Damian is getting suspicious.",
  multipleOption: true,
  choices: [
    {"Tell him about the letters": 104},
    {"Walk away": 105}
  ],
),

// Story 101: Planning Next Steps with Mia
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You and Mia decide to confront James.",
  multipleOption: false,
  choices: [
    {"Continue": 106}
  ],
),

// Story 102: Apologizing to Mrs. Bredessen
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeTwoCard,
  emotion: Emotion.Happy,
  speaker: null,
  title:
      "I'm sorry. I was just trying to help.",
  multipleOption: false,
  choices: [
    {"Continue": 107}
  ],
),

// Story 103: Leaving Mrs. Bredessen
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You decide it's best to leave her alone.",
  multipleOption: false,
  choices: [
    {"Continue": 108}
  ],
),

// Story 104: Damian's Proposal
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Default,
  speaker: damCharacter,
  title:
      "We can work together to uncover the truth.",
  multipleOption: false,
  choices: [
    {"Agree": 109},
    {"Decline": 110}
  ],
),

// Story 105: Walking Away from Damian
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You decide not to engage with Damian.",
  multipleOption: false,
  choices: [
    {"Continue": 111}
  ],
),

// Story 106: Confronting James Again
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Default,
  speaker: jamesCharacter,
  title:
      "What now?",
  multipleOption: false,
  choices: [
    {"Continue": 112}
  ],
),

// Story 107: Mrs. Bredessen Softens
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Happy,
  speaker: bredwCharacter,
  title:
      "I know you're trying to help. It's just... complicated.",
  multipleOption: false,
  choices: [
    {"Continue": 113}
  ],
),

// Story 108: Considering Your Options
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You wonder who else might know about the letters.",
  multipleOption: true,
  choices: [
    {"Talk to the detective": 114},
    {"Search for more clues": 115}
  ],
),

// Story 109: Teaming Up with Damian
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You and Damian decide to collaborate.",
  multipleOption: false,
  choices: [
    {"Continue": 116}
  ],
),

// Story 110: Declining Damian's Offer
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeTwoCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "I'd rather handle this on my own.",
  multipleOption: false,
  choices: [
    {"Continue": 117}
  ],
),

// Story 111: Heading Back to Your Room
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You decide to return to your room to think.",
  multipleOption: false,
  choices: [
    {"Continue": 118}
  ],
),

// Story 112: Presenting the Evidence to James
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeTwoCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "We know about the inheritance dispute.",
  multipleOption: false,
  choices: [
    {"Continue": 119}
  ],
),

// Story 113: Gaining Mrs. Bredessen's Trust
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Happy,
  speaker: null,
  title:
      "She seems more willing to talk now.",
  multipleOption: true,
  choices: [
    {"Ask about the letters": 120},
    {"Change the subject": 121}
  ],
),

// Story 114: Seeking Out Detective Reynolds
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You find the detective reviewing notes.",
  multipleOption: false,
  choices: [
    {"Continue": 122}
  ],
),

// Story 115: Exploring the Mansion Further
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You decide to search other rooms for clues.",
  multipleOption: false,
  choices: [
    {"Continue": 123}
  ],
),

// Story 116: Damian Shares Information
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Default,
  speaker: damCharacter,
  title:
      "I've been investigating on my own. Here's what I found.",
  multipleOption: false,
  choices: [
    {"Continue": 124}
  ],
),

// Story 117: Damian's Disappointment
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Shocked,
  speaker: damCharacter,
  title:
      "Suit yourself.",
  multipleOption: false,
  choices: [
    {"Continue": 125}
  ],
),

// Story 118: Unexpected Visitor
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "There's a knock on your door.",
  multipleOption: false,
  choices: [
    {"Answer it": 126}
  ],
),

// Story 119: James's Reaction
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Shocked,
  speaker: jamesCharacter,
  title:
      "You don't know the whole story.",
  multipleOption: false,
  choices: [
    {"Continue": 127}
  ],
),

// Story 120: Asking About the Letters
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeTwoCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "Can you tell me more about these letters?",
  multipleOption: false,
  choices: [
    {"Continue": 128}
  ],
),

// Story 121: Changing the Subject
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeTwoCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "How are you holding up?",
  multipleOption: false,
  choices: [
    {"Continue": 129}
  ],
),

// Story 122: Discussing Findings with the Detective
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Default,
  speaker: detectiveCharacter,
  title:
      "What have you found?",
  multipleOption: false,
  choices: [
    {"Continue": 130}
  ],
),

// Story 123: Discovering a Hidden Room
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "You stumble upon a room not marked on any map.",
  multipleOption: false,
  choices: [
    {"Continue": 131}
  ],
),

// Story 124: Reviewing Damian's Findings
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "He shows you documents linking James to questionable activities.",
  multipleOption: false,
  choices: [
    {"Continue": 132}
  ],
),

// Story 125: Damian Walks Away
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "Damian leaves, and you're left alone.",
  multipleOption: false,
  choices: [
    {"Continue": 133}
  ],
),

// Story 126: Mia at Your Door
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Happy,
  speaker: miaCharacter,
  title:
      "I think I found something important.",
  multipleOption: false,
  choices: [
    {"Continue": 133}
  ],
),

// Story 127: Pressing James for More
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeTwoCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "Then tell me your side of the story.",
  multipleOption: false,
  choices: [
    {"Continue": 134}
  ],
),

// Story 128: Mrs. Bredessen Opens Up
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Happy,
  speaker: bredwCharacter,
  title:
      "Those letters were from a disgruntled business partner.",
  multipleOption: false,
  choices: [
    {"Continue": 135}
  ],
),

// Story 129: Mrs. Bredessen's Gratitude
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Happy,
  speaker: bredwCharacter,
  title:
      "Thank you for your concern.",
  multipleOption: false,
  choices: [
    {"Continue": 136}
  ],
),

// Story 130: Sharing the Letters with the Detective
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You hand over the letters to Detective Reynolds.",
  multipleOption: false,
  choices: [
    {"Continue": 137}
  ],
),

// Story 131: Exploring the Hidden Room
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "The room contains artifacts and a portrait of an unknown person.",
  multipleOption: false,
  choices: [
    {"Continue": 138}
  ],
),

// Story 132: Deciding to Trust Damian
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You realize Damian might be a valuable ally.",
  multipleOption: false,
  choices: [
    {"Continue": 139}
  ],
),

// Story 133: Investigating with Mia
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Happy,
  speaker: null,
  title:
      "You and Mia decide to follow up on her lead.",
  multipleOption: false,
  choices: [
    {"Continue": 140}
  ],
),

// Story 134: James's Confession
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Shocked,
  speaker: jamesCharacter,
  title:
      "Fine. I've been trying to secure my share of the inheritance.",
  multipleOption: false,
  choices: [
    {"Continue": 141}
  ],
),

// Story 135: Learning About the Business Partner
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You realize this partner might be a suspect.",
  multipleOption: false,
  choices: [
    {"Continue": 142}
  ],
),

// Story 136: Offering Further Help
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeTwoCard,
  emotion: Emotion.Happy,
  speaker: null,
  title:
      "If there's anything else I can do, let me know.",
  multipleOption: false,
  choices: [
    {"Continue": 143}
  ],
),

// Story 137: Detective's Appreciation
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Happy,
  speaker: detectiveCharacter,
  title:
      "This is valuable information.",
  multipleOption: false,
  choices: [
    {"Continue": 144}
  ],
),

// Story 138: Finding a Key Item
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "You find a sealed envelope addressed to Damian.",
  multipleOption: false,
  choices: [
    {"Continue": 145}
  ],
),

// Story 139: Forming an Alliance
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You and Damian agree to share any new findings.",
  multipleOption: false,
  choices: [
    {"Continue": 146}
  ],
),

// Story 140: Mia's Discovery
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Shocked,
  speaker: miaCharacter,
  title:
      "Look at this. It could be a clue.",
  multipleOption: false,
  choices: [
    {"Continue": 147}
  ],
),

// Story 141: Considering James's Motive
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You wonder if James could be the culprit.",
  multipleOption: false,
  choices: [
    {"Continue": 148}
  ],
),

// Story 142: Deciding to Inform the Detective
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You decide to tell Detective Reynolds about the business partner.",
  multipleOption: false,
  choices: [
    {"Continue": 149}
  ],
),

// Story 143: Mrs. Bredessen's Appreciation
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Happy,
  speaker: bredwCharacter,
  title:
      "You've been a great help.",
  multipleOption: false,
  choices: [
    {"Continue": 150}
  ],
),

// Story 144: Level 3 Conclusion (Detective's Perspective)
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "With your assistance, the detective feels closer to solving the case.",
  multipleOption: false,
  choices: [
    {"THE END OF LEVEL 3": 0}
  ],
),

// Story 145: Deciding What to Do with the Envelope
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You need to decide whether to open it or give it to Damian.",
  multipleOption: true,
  choices: [
    {"Open it": 150},
    {"Give it to Damian": 146}
  ],
),

// Story 146: Continuing Alliance with Damian
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You hand the envelope to Damian, strengthening your trust.",
  multipleOption: false,
  choices: [
    {"Continue": 150}
  ],
),

// Story 147: Mia's Clue Leads to Revelation
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "The clue suggests an outside party may be involved.",
  multipleOption: false,
  choices: [
    {"Continue": 150}
  ],
),

// Story 148: Deciding to Monitor James
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Default,
  speaker: null,
  title:
      "You decide to keep an eye on James for any suspicious activity.",
  multipleOption: false,
  choices: [
    {"Continue": 150}
  ],
),

// Story 149: Detective Thanks You
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeThreeCard,
  emotion: Emotion.Happy,
  speaker: detectiveCharacter,
  title:
      "This could be the breakthrough we needed.",
  multipleOption: false,
  choices: [
    {"Continue": 150}
  ],
),

// Story 150: Level 3 Conclusion
Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "As the day comes to an end, you realize the mansion holds more secrets than you imagined. Your investigation is far from over.",
  multipleOption: false,
  choices: [
    {"THE END OF LEVEL 3": 0}
  ],
),

Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "As the day comes to an end, you realize the mansion holds more secrets than you imagined. Your investigation is far from over.",
  multipleOption: false,
  choices: [
    {"THE END OF LEVEL 3": 0}
  ],
),

Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "As the day comes to an end, you realize the mansion holds more secrets than you imagined. Your investigation is far from over.",
  multipleOption: false,
  choices: [
    {"THE END OF LEVEL 3": 0}
  ],
),


Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "As the day comes to an end, you realize the mansion holds more secrets than you imagined. Your investigation is far from over.",
  multipleOption: false,
  choices: [
    {"THE END OF LEVEL 3": 0}
  ],
),

Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "As the day comes to an end, you realize the mansion holds more secrets than you imagined. Your investigation is far from over.",
  multipleOption: false,
  choices: [
    {"THE END OF LEVEL 3": 0}
  ],
),

Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "As the day comes to an end, you realize the mansion holds more secrets than you imagined. Your investigation is far from over.",
  multipleOption: false,
  choices: [
    {"THE END OF LEVEL 3": 0}
  ],
),

Story(
  bg: StoryBackground.bg1,
  type: StoryType.TypeOneCard,
  emotion: Emotion.Shocked,
  speaker: null,
  title:
      "As the day comes to an end, you realize the mansion holds more secrets than you imagined. Your investigation is far from over.",
  multipleOption: false,
  choices: [
    {"THE END OF LEVEL 3": 0}
  ],
),









        ]),
  ];
}


// class StoryBrain {
//   static List<Story> all = [
//     Story(
//       bg: StoryBackground.bg1,
//       type: StoryType.TypeOneCard,
//       emotion: Emotion.Shocked,
//       speaker: null,
//       title: "Your car has broken down on a winding road in the middle of nowhere with no cell phone reception",
//       multipleOption: false,
//       choices: [
//         {"Next": 1},
//       ],
//     ),
//     Story(
//       bg: StoryBackground.bg1,
//       type: StoryType.TypeTwoCard,
//       emotion: Emotion.Shocked,
//       speaker: null,
//       title: "#%@!, Not again",
//       multipleOption: true,
//       choices: [
//         {"Give Up": 3},
//         {"Continue fixing it": 2},
//       ],
//     ),
//     Story(
//       bg: StoryBackground.bg1,
//       type: StoryType.TypeOneCard,
//       emotion: Emotion.Shocked,
//       speaker: null,
//       title: "Your car once again seems not to start. After a growling sound, you realize it's no use",
//       multipleOption: false,
//       choices: [
//         {"Next": 3},
//       ],
//     ),
//     Story(
//       bg: StoryBackground.bg1,
//       type: StoryType.TypeOneCard,

//       emotion: Emotion.Shocked,
//       speaker: null,
//       title: "Realizing your car won't start anytime soon, you decide to hitchhike \n \nAfter just a few minutes, a seemingly drunk couple in a green toyota pulls up",
//       multipleOption: false,
//       choices: [
//         {"Next": 4},
//       ],
//     ),
//     Story(
//       bg: StoryBackground.bg1,
//       type: StoryType.TypeTwoCard,

//       emotion: Emotion.Happy,
//       speaker: null,
//       title: "Yes!",
//       multipleOption: false,
//       choices: [
//         {"Next": 5},
//       ],
//     ),

//     Story(
//     bg: StoryBackground.bg1,
//     type: StoryType.TypeThreeCard,
//     emotion: Emotion.Default,
//     speaker: swCharacter,
//     title: "What is someone like you doing out here alone? \n \n They're a lot of bad people out here... murderers and all",
//     multipleOption: false,
//     choices: [{"Next": 6}],
//   ),
//   Story(
//     bg: StoryBackground.bg1,
//     type: StoryType.TypeThreeCard,
//     emotion: Emotion.Default,
//     speaker: smCharacter,
//     title: "Dawg, you better find a way out of here before dark",
//     multipleOption: true,
//     choices: [{"Ignore them": 7}, {"See if he can be of any help": 9}],
//   ),
//   Story(
//     bg: StoryBackground.bg1,
//     type: StoryType.TypeTwoCard,
//     emotion: Emotion.Shocked,
//     speaker: null,
//     title: "...",
//     multipleOption: false,
//     choices: [{"Next": 8}],
//   ),
//   Story(
//     bg: StoryBackground.bg1,
//     type: StoryType.TypeThreeCard,
//     emotion: Emotion.Default,
//     speaker: swCharacter,
//     title: "Rude!",
//     multipleOption: false,
//     choices: [{"Next": 10}],
//   ),
//   Story(
//     bg: StoryBackground.bg1,
//     type: StoryType.TypeTwoCard,
//     emotion: Emotion.Default,
//     speaker: null,
//     title: "Can I get a ride to the nearest town?",
//     multipleOption: false,
//     choices: [{"Next": 11}],
//   ),
//   Story(
//     bg: StoryBackground.bg1,
//     type: StoryType.TypeThreeCard,
//     emotion: Emotion.Default,
//     speaker: smCharacter,
//     title: "Soothe yourself",
//     multipleOption: false,
//     choices: [{"Next": 13}],
//   ),
//   Story(
//     bg: StoryBackground.bg1,
//     type: StoryType.TypeThreeCard,
//     emotion: Emotion.Default,
//     speaker: smCharacter,
//     title: "Hell naw! How do I know you're not one of them? Can't risk that",
//     multipleOption: false,
//     choices: [{"Next": 12}],
//   ),
//   Story(
//     bg: StoryBackground.bg1,
//     type: StoryType.TypeThreeCard,
//     emotion: Emotion.Default,
//     speaker: swCharacter,
//     title: "HAHAHAHAHA",
//     multipleOption: false,
//     choices: [{"Next": 13}],
//   ),
//   Story(
//     bg: StoryBackground.bg1,
//     type: StoryType.TypeOneCard,
//     emotion: Emotion.Default,
//     speaker: null,
//     title: "They zoom off, with his warning ringing in your head",
//     multipleOption: false,
//     choices: [{"Next": 14}],
//   ),
//   Story(
//     bg: StoryBackground.bg1,
//     type: StoryType.TypeOneCard,
//     emotion: Emotion.Default,
//     speaker: null,
//     title: "After what seems like an eternity and a million cars later, a rusty pickup truck rumbles to a stop next to you. \n \nA man with a wide brimmed hat with soulless eyes opens the passenger door for you",
//     multipleOption: false,
//     choices: [{"Next": 15}],
//   ),
//   Story(
//     bg: StoryBackground.bg1,
//     type: StoryType.TypeTwoCard,
//     emotion: Emotion.Happy,
//     speaker: null,
//     title: "Finally!",
//     multipleOption: false,
//     choices: [{"Next": 16}],
//   ),
//   Story(
//     bg: StoryBackground.bg1,
//     type: StoryType.TypeThreeCard,
//     emotion: Emotion.Default,
//     speaker: omCharacter,
//     title: "Need a ride?",
//     multipleOption: true,
//     choices: [{"I'll hop in. Thanks for the help!": 19}, {"Better ask him if he's a murderer first.": 17}],
//   ),
//   Story(
//     bg: StoryBackground.bg2,
//     type: StoryType.TypeTwoCard,
//     emotion: Emotion.Happy,
//     speaker: null,
//     title: "You're into murdering people, are you? \n \n[nervous laugh]",
//     multipleOption: false,
//     choices: [{"Next": 18}],
//   ),
//   Story(
//     bg: StoryBackground.bg2,
//     type: StoryType.TypeThreeCard,
//     emotion: Emotion.Default,
//     speaker: omCharacter,
//     title: "Yes, you must be a psychic or something!",
//     multipleOption: true,
//     choices: [{"At least he's honest. I'll climb in.": 19}, {"Nah, I'm good": 20}],
//   ),
//   Story(
//     bg: StoryBackground.bg2,
//     type: StoryType.TypeTwoCard,
//     emotion: Emotion.Default,
//     speaker: null,
//     title: "Thanks!",
//     multipleOption: false,
//     choices: [{"Next": 21}],
//   ),
//   Story(
//     bg: StoryBackground.bg1,
//     type: StoryType.TypeOneCard,
//     emotion: Emotion.Default,
//     speaker: null,
//     title: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
//     multipleOption: false,
//     choices: [{"THE END": 0}],
//   ),
//   Story(
//     bg: StoryBackground.bg2,
//     type: StoryType.TypeOneCard,
//     emotion: Emotion.Default,
//     speaker: null,
//     title: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute",
//     multipleOption: false,
//     choices: [{"Next": 22}],
//   ),
//   Story(
//     bg: StoryBackground.bg2,
//     type: StoryType.TypeThreeCard,
//     emotion: Emotion.Default,
//     speaker: omCharacter,
//     title: "We should lighten up the mood, I have Taylor Swift's Midnight Album Cassette in there",
//     multipleOption: false,
//     choices: [{"Sure thing!": 23}],
//   ),
//   Story(
//     bg: StoryBackground.bg2,
//     type: StoryType.TypeOneCard,
//     emotion: Emotion.Default,
//     speaker: null,
//     title: "Inside you find a bloody knife, two severed fingers, and a cassette tape of Taylor Swift. He reaches for the glove box.",
//     multipleOption: false,
//     choices: [{"Next": 24}],
//   ),
//   Story(
//     bg: StoryBackground.bg2,
//     type: StoryType.TypeThreeCard,
//     emotion: Emotion.Default,
//     speaker: omCharacter,
//     title: "...",
//     multipleOption: true,
//     choices: [{"I love Taylor Swift! Hand him the cassette tape.": 25}, {"It's him or me! You take the knife and stab him.": 32}],
//   ),
//   Story(
//     bg: StoryBackground.bg2,
//     type: StoryType.TypeOneCard,
//     emotion: Emotion.Default,
//     speaker: null,
//     title: "You bond with the murderer while crooning verses of 'Midnight Rain'.",
//     multipleOption: false,
//     choices: [{"Next": 26}],
//   ),
//   Story(
//     bg: StoryBackground.bg3,
//     type: StoryType.TypeOneCard,
//     emotion: Emotion.Default,
//     speaker: null,
//     title: "He drops you off at the next town. Before you go he turns to you",
//     multipleOption: false,
//     choices: [{"Next": 27}],
//   ),
//   Story(
//     bg: StoryBackground.bg3,
//     type: StoryType.TypeThreeCard,
//     emotion: Emotion.Default,
//     speaker: omCharacter,
//     title: "Do you know any good places to dump bodies?",
//     multipleOption: false,
//     choices: [{"Next": 28}],
//   ),
//   Story(
//     bg: StoryBackground.bg3,
//     type: StoryType.TypeTwoCard,
//     emotion: Emotion.Default,
//     speaker: null,
//     title: "Try the pier",
//     multipleOption: false,
//     choices: [{"Next": 29}],
//   ),
//   Story(
//     bg: StoryBackground.bg3,
//     type: StoryType.TypeThreeCard,
//     emotion: Emotion.Default,
//     speaker: omCharacter,
//     title: "Thanks!",
//     multipleOption: false,
//     choices: [{"Next": 30}],
//   ),
//   Story(
//     bg: StoryBackground.bg3,
//     type: StoryType.TypeThreeCard,
//     emotion: Emotion.Default,
//     speaker: omCharacter,
//     title: "You're one of the lucky ones",
//     multipleOption: false,
//     choices: [{"Next": 31}],
//   ),
//   Story(
//     bg: StoryBackground.bg1,
//     type: StoryType.TypeOneCard,
//     emotion: Emotion.Default,
//     speaker: null,
//     title: "He zooms off",
//     multipleOption: false,
//     choices: [{"THE END": 0}],
//   ),

//   Story(
//   bg: StoryBackground.bg2,
//   type: StoryType.TypeOneCard,
//   emotion: Emotion.Default,
//   speaker: null,
//   title: "As you smash through the guardrail and careen towards the jagged rocks below, you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
//   multipleOption: false,
//   choices: [{"Next": 33}],
// ),

// Story(
//   bg: StoryBackground.bg2,
//   type: StoryType.TypeTwoCard,
//   emotion: Emotion.Shocked,
//   speaker: null,
//   title: "Well, that was stupid...",
//   multipleOption: false,
//   choices: [{"Next": 34}],
// ),

// Story(
//   bg: StoryBackground.bg2,
//   type: StoryType.TypeOneCard,
//   emotion: Emotion.Default,
//   speaker: null,
//   title: "You crash into rocks and go unconscious.",
//   multipleOption: false,
//   choices: [{"THE END": 0}],
// ),

//   ];
// }
