import 'package:equatable/equatable.dart';
import 'dart:convert';

class Grocery extends Equatable {
  final String id;
  final String description;

  const Grocery({
    required this.id,
    required this.description,
  });

  Grocery copyWith({
    String? id,
    String? description,
  }) {
    return Grocery(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  factory Grocery.fromJson(Map<String, dynamic> jsonData) {
    return Grocery(
      id: jsonData['id'],
      description: jsonData['description'],
    );
  }

  static Map<String, dynamic> toMap(Grocery grocery) => {
        'id': grocery.id,
        'description': grocery.description,
      };

  static String encode(List<Grocery> grocery) => json.encode(
        grocery
            .map<Map<String, dynamic>>((item) => Grocery.toMap(item))
            .toList(),
      );

  static List<Grocery> decode(String grocery) {
    return (json.decode(grocery) as List<dynamic>)
        .map<Grocery>((item) => Grocery.fromJson(item))
        .toList();
  }

  @override
  List<Object?> get props => [id, description];
}
