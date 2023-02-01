import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [id, description];
}
