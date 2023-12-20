// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

List<ItemModel> itemModelFromJson(String str) => List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String itemModelToJson(List<ItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
    String name;
    String url;
    String image;

    ItemModel({
        required this.name,
        required this.url,
        required this.image,
    });

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        name: json["name"],
        url: json["url"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "image": image,
    };
}
