import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlantDetailModel {
  final String scientific;
  final String localName;
  final String description;
  final String image;
  final List<String> advantage;
  final List<String> disadvantage;
  PlantDetailModel({
    required this.scientific,
    required this.localName,
    required this.description,
    required this.image,
    required this.advantage,
    required this.disadvantage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'scientific': scientific,
      'localName': localName,
      'description': description,
      'image': image,
      'advantage': advantage,
      'disadvantage': disadvantage,
    };
  }

  factory PlantDetailModel.fromMap(Map<String, dynamic> map) {
    return PlantDetailModel(
      scientific: map['scientific'] as String,
      localName: map['localName'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      advantage: List<String>.from((map['advantage'] as List<String>)),
      disadvantage: List<String>.from((map['disadvantage'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlantDetailModel.fromJson(String source) =>
      PlantDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
