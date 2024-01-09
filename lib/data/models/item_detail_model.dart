// To parse this JSON data, do
//
//     final itemDetailModel = itemDetailModelFromJson(jsonString);

import 'dart:convert';

List<ItemDetailModel> itemDetailModelFromJson(String str) => List<ItemDetailModel>.from(json.decode(str).map((x) => ItemDetailModel.fromJson(x)));

String itemDetailModelToJson(List<ItemDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemDetailModel {
  String? name;
  List<String>? gallery;
  String? image;
  String? race;
  String? gender;
  String? age;
  String? height;
  String? weight;
  String? birthday;
  String? hairColor;
  String? eyeColor;
  String? affiliation;
  String? occupation;
  String? combatStyle;
  String? partnerS;
  String? status;
  String? relativeS;
  String? mangaDebut;
  String? animeDebut;
  String? japaneseVa;
  String? englishVa;
  String? stagePlay;

  ItemDetailModel({
    this.name,
    this.gallery,
    this.image,
    this.race,
    this.gender,
    this.age,
    this.height,
    this.weight,
    this.birthday,
    this.hairColor,
    this.eyeColor,
    this.affiliation,
    this.occupation,
    this.combatStyle,
    this.partnerS,
    this.status,
    this.relativeS,
    this.mangaDebut,
    this.animeDebut,
    this.japaneseVa,
    this.englishVa,
    this.stagePlay,
  });

  factory ItemDetailModel.fromJson(Map<String, dynamic> json) =>
      ItemDetailModel(
        name: json["name"],
        gallery: List<String>.from(json["gallery"].map((x) => x)),
        image: json["image"],
        race: json["race"],
        gender: json["gender"],
        age: json["age"],
        height: json["height"],
        weight: json["weight"],
        birthday: json["birthday"],
        hairColor: json["hair color"],
        eyeColor: json["eye color "],
        affiliation: json["affiliation"],
        occupation: json["occupation"],
        combatStyle: json["combat style"],
        partnerS: json["partner(s)"],
        status: json["status"],
        relativeS: json["relative(s)"],
        mangaDebut: json["manga debut"],
        animeDebut: json["anime debut"],
        japaneseVa: json["japanese va"],
        englishVa: json["english va"],
        stagePlay: json["stage play"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gallery": List<dynamic>.from(gallery!.map((x) => x)),
        "image": image,
        "race": race,
        "gender": gender,
        "age": age,
        "height": height,
        "weight": weight,
        "birthday": birthday,
        "hair color": hairColor,
        "eye color ": eyeColor,
        "affiliation": affiliation,
        "occupation": occupation,
        "combat style": combatStyle,
        "partner(s)": partnerS,
        "status": status,
        "relative(s)": relativeS,
        "manga debut": mangaDebut,
        "anime debut": animeDebut,
        "japanese va": japaneseVa,
        "english va": englishVa,
        "stage play": stagePlay,
      };
}

class ItemDetailLocalModel {
  String? itemId;
  String? name;
  String? gallery;
  String? image;
  String? race;
  String? gender;
  String? age;
  String? height;
  String? weight;
  String? birthday;
  String? hairColor;
  String? eyeColor;
  String? affiliation;
  String? occupation;
  String? combatStyle;
  String? partnerS;
  String? status;
  String? relativeS;
  String? mangaDebut;
  String? animeDebut;
  String? japaneseVa;
  String? englishVa;
  String? stagePlay;

  ItemDetailLocalModel({
    this.itemId,
    this.name,
    this.gallery,
    this.image,
    this.race,
    this.gender,
    this.age,
    this.height,
    this.weight,
    this.birthday,
    this.hairColor,
    this.eyeColor,
    this.affiliation,
    this.occupation,
    this.combatStyle,
    this.partnerS,
    this.status,
    this.relativeS,
    this.mangaDebut,
    this.animeDebut,
    this.japaneseVa,
    this.englishVa,
    this.stagePlay,
  });

  factory ItemDetailLocalModel.fromJson(Map<String, dynamic> json) =>
      ItemDetailLocalModel(
        itemId: json["itemId"],
        name: json["name"],
        gallery: "Gallery",
        image: json["image"],
        race: json["race"],
        gender: json["gender"],
        age: json["age"],
        height: json["height"],
        weight: json["weight"],
        birthday: json["birthday"],
        hairColor: json["hair_color"],
        eyeColor: json["eye_color "],
        affiliation: json["affiliation"],
        occupation: json["occupation"],
        combatStyle: json["combat_style"],
        partnerS: json["partners"],
        status: json["status"],
        relativeS: json["relative"],
        mangaDebut: json["manga_debut"],
        animeDebut: json["anime_debut"],
        japaneseVa: json["japanese_va"],
        englishVa: json["english_va"],
        stagePlay: json["stage_play"],
      );

  Map<String, dynamic> toJson() => {
    "itemId" : itemId,
        "name": name,
        "gallery": gallery,
        "image": image,
        "race": race,
        "gender": gender,
        "age": age,
        "height": height,
        "weight": weight,
        "birthday": birthday,
        "hair_color": hairColor,
        "eye_color": eyeColor,
        "affiliation": affiliation,
        "occupation": occupation,
        "combat_style": combatStyle,
        "partners": partnerS,
        "status": status,
        "relative": relativeS,
        "manga_debut": mangaDebut,
        "anime_debut": animeDebut,
        "japanese_va": japaneseVa,
        "english_va": englishVa,
        "stage_play": stagePlay,
      };
}

class ImagesModel {
  String itemId;
  List<String> imageUrl;

  ImagesModel({
    required this.itemId,
    required this.imageUrl,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
        itemId: json["itemId"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
      };
}

class SingleImagesModel {
  String itemId;
  String imageUrl;

  SingleImagesModel({
    required this.itemId,
    required this.imageUrl,
  });

  factory SingleImagesModel.fromJson(Map<String, dynamic> json) =>
      SingleImagesModel(
        itemId: json["itemId"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "imageUrl": imageUrl,
      };
}
