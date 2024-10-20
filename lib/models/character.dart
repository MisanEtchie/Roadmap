class Character {
  final String name;
  final String defaultImage;
  final String shockedImage;
  final String happyImage;
  final String? loveImage; 

  Character({
    required this.name,
    required this.defaultImage,
    required this.shockedImage,
    required this.happyImage,
    this.loveImage, 
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'defaultImage': defaultImage,
      'shockedImage': shockedImage,
      'happyImage': happyImage,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      name: map['name'] as String,
      defaultImage: map['defaultImage'] as String,
      shockedImage: map['shockedImage'] as String,
      happyImage: map['happyImage'] as String,
    );
  }
}


Character amCharacter = Character(
  name: 'AM',
  defaultImage: 'assets/images/AM.jpg', 
  shockedImage: 'assets/images/AMShocked.jpg', 
  happyImage: 'assets/images/AMHappy.jpg', 
);

Character awCharacter = Character(
  name: 'AW',
  defaultImage: 'assets/images/AW.jpg', 
  shockedImage: 'assets/images/AWShocked.jpg', 
  happyImage: 'assets/images/AWHappy.jpg', 
);

Character bmCharacter = Character(
  name: 'BM',
  defaultImage: 'assets/images/BM.png', 
  shockedImage: 'assets/images/BMShocked.png', 
  happyImage: 'assets/images/BMHappy.png', 
);

Character lwCharacter = Character(
  name: 'LW',
  defaultImage: 'assets/images/LW.jpg', 
  shockedImage: 'assets/images/LWShocked.jpg', 
  happyImage: 'assets/images/LWHappy.jpg', 
);

Character lmCharacter = Character(
  name: 'LM',
  defaultImage: 'assets/images/LM.jpg', 
  shockedImage: 'assets/images/LMShocked.jpg', 
  happyImage: 'assets/images/LMHappy.jpg', 
);

Character wwCharacter = Character(
  name: 'WW',
  defaultImage: 'assets/images/WW.jpg', 
  shockedImage: 'assets/images/WWShocked.jpg', 
  happyImage: 'assets/images/WWHappy.jpg', 
);

Character wmCharacter = Character(
  name: 'WM',
  defaultImage: 'assets/images/WM.jpg', 
  shockedImage: 'assets/images/WMShocked.jpg', 
  happyImage: 'assets/images/WMHappy.jpg', 
);


Character bwCharacter = Character(
  name: 'BW',
  defaultImage: 'assets/images/BW.jpg', 
  shockedImage: 'assets/images/BWShocked.jpg', 
  happyImage: 'assets/images/BWHappy.jpg', 
);

Character smCharacter = Character(
  name: 'Strange Man',
  defaultImage: 'assets/images/StrangeMan.jpg', 
  shockedImage: 'assets/images/StrangeMan.jpg', 
  happyImage: 'assets/images/StrangeMan.jpg', 
);

Character swCharacter = Character(
  name: 'Strange Woman',
  defaultImage: 'assets/images/StrangeWoman.jpg', 
  shockedImage: 'assets/images/StrangeWoman.jpg', 
  happyImage: 'assets/images/StrangeWoman.jpg', 
);

Character omCharacter = Character(
  name: 'Old Man',
  defaultImage: 'assets/images/OM.jpg', 
  shockedImage: 'assets/images/OMSmirk.jpg', 
  happyImage: 'assets/images/OMSmirk.jpg', 
);

Character bredwCharacter = Character(
  name: 'Mrs Bredessen',
  defaultImage: 'assets/images/BredW.png', 
  shockedImage: 'assets/images/BredWShocked.png', 
  happyImage: 'assets/images/BredWHappy.png', 
);

Character bredmCharacter = Character(
  name: 'Mr Bredessen',
  defaultImage: 'assets/images/BredM.png', 
  shockedImage: 'assets/images/BredMShocked.png', 
  happyImage: 'assets/images/BredMHappy.png', 
);

Character jamesCharacter = Character(
  name: 'James',
  defaultImage: 'assets/images/James.png', 
  shockedImage: 'assets/images/JamesShocked.png', 
  happyImage: 'assets/images/JamesHappy.png', 
);

Character miaCharacter = Character(
  name: 'Mia',
  defaultImage: 'assets/images/Mia.png', 
  shockedImage: 'assets/images/MiaShocked.png', 
  happyImage: 'assets/images/MiaHappy.png', 
);

Character damCharacter = Character(
  name: 'Damian',
  defaultImage: 'assets/images/Dam.png', 
  shockedImage: 'assets/images/DamShocked.png', 
  happyImage: 'assets/images/DamHappy.png', 
);

Character love1Character = Character(
  name: 'Alex',
  defaultImage: 'assets/images/Love1.png', 
  shockedImage: 'assets/images/Love1Shocked.png', 
  happyImage: 'assets/images/Love1Happy.png', 
  loveImage: 'assets/images/Love1Love'
);

Character detectiveCharacter = Character(
  name: 'Detective Reynolds',
  defaultImage: 'assets/images/Love1.png', 
  shockedImage: 'assets/images/Love1Shocked.png', 
  happyImage: 'assets/images/Love1Happy.png', 
  loveImage: 'assets/images/Love1Love'
);

// love2Character
Character love2Character = Character(
  name: 'Alex',
  defaultImage: 'assets/images/Love2.png', 
  shockedImage: 'assets/images/Love2Shocked.png', 
  happyImage: 'assets/images/Love2Happy.png', 
  loveImage: 'assets/images/Love2Love.png', // Added .png extension
);

// love3Character
Character love3Character = Character(
  name: 'Alex',
  defaultImage: 'assets/images/Love3.png', 
  shockedImage: 'assets/images/Love3Shocked.png', 
  happyImage: 'assets/images/Love3Happy.png', 
  loveImage: 'assets/images/Love3Love.png', // Added .png extension
);

// love4Character
Character love4Character = Character(
  name: 'Alex',
  defaultImage: 'assets/images/Love4.png', 
  shockedImage: 'assets/images/Love4Shocked.png', 
  happyImage: 'assets/images/Love4Happy.png', 
  loveImage: 'assets/images/Love4Love.png', // Added .png extension
);

