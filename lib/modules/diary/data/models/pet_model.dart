import 'dart:convert';

import 'package:dailypet/modules/diary/domain/entities/pet.dart';

class PetModel extends Pet {
  PetModel(
    int id,
    String name,
    String description,
  ) : super(id, name, description);

  PetModel copyWith({
    int id,
    String name,
    String description,
  }) {
    return PetModel(
      id ?? this.id,
      name ?? this.name,
      description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PetModel(
      map['id'],
      map['name'],
      map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PetModel.fromJson(String source) =>
      PetModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'PetModel(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PetModel &&
        o.id == id &&
        o.name == name &&
        o.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
