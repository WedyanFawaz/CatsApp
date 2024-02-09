class Cats {
  late final String name;
  late final String length;
  late final String origin;
  late final String imageLink;
  late final int familyFriendly;
  late final int shedding;
  late final int generalHealth;
  late final int playfulness;
  late final int childrenFriendly;
  late final int grooming;
  late final int intelligence;
  late final int otherPetsFriendly;
  late final double minWeight;
  late final double maxWeight;
  late final double minLifeExpectancy;
  late final double maxLifeExpectancy;


  Cats.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'] ?? 'Unknown';
    length = json['length'] ?? 'Unknown';
    origin = json['origin'] ?? 'Unknown';
    imageLink = json['image_link'] ?? '';
    familyFriendly = json['family_friendly'] ?? 0;
    shedding = json['shedding'] ?? 0;
    generalHealth = json['general_health'] ?? 0;
    playfulness = json['playfulness'] ?? 0;
    childrenFriendly = json['children_friendly'] ?? 0;
    grooming = json['grooming'] ?? 0;
    intelligence = json['intelligence'] ?? 0;
    otherPetsFriendly = json['other_pets_friendly'] ?? 0;
    minWeight = json['min_weight'] ?? 0.0;
    maxWeight = json['max_weight'] ?? 0.0;
    minLifeExpectancy = json['min_life_expectancy'] ?? 0.0;
    maxLifeExpectancy = json['max_life_expectancy'] ?? 0.0;
  }
}
