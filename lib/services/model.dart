// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PlantModel {
  final String detection;
  final double confidence;
  PlantModel({
    required this.detection,
    required this.confidence,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'detection': detection,
      'confidence': confidence,
    };
  }

  factory PlantModel.fromMap(Map<String, dynamic> map) {
    return PlantModel(
      detection: map['detection'] ?? '',
      confidence: map['confidence'] ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlantModel.fromJson(String source) =>
      PlantModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
