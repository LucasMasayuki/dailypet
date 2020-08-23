import 'dart:convert';

import 'package:dailypet/modules/diary/infra/models/pet_model.dart';
import 'package:dailypet/modules/diary/domain/entities/diary.dart';

class DiaryModel extends Diary {
  DiaryModel(
    int id,
    String title,
    PetModel pet,
  ) : super(id, title, pet);

  DiaryModel copyWith({
    int id,
    String title,
    PetModel pet,
  }) {
    return DiaryModel(
      id ?? this.id,
      title ?? this.title,
      pet ?? this.pet,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': title,
      'pet': pet?.toMap(),
    };
  }

  factory DiaryModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DiaryModel(
      map['id'],
      map['name'],
      PetModel.fromMap(map['pet']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DiaryModel.fromJson(String source) =>
      DiaryModel.fromMap(json.decode(source));

  @override
  String toString() => 'DiaryModel(id: $id, name: $title, pet: $pet)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DiaryModel && o.id == id && o.title == title && o.pet == pet;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ pet.hashCode;
}
