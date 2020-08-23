import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dailypet/modules/diary/domain/entities/diary.dart';
import 'package:dailypet/modules/diary/domain/usercases/get_diaries_case.dart';
import 'package:dailypet/modules/diary/domain/errors/InvalidUserIdError.dart';
import 'package:dailypet/modules/diary/domain/repositories/diary_repository.dart';

class DiaryRepositoryMock extends Mock implements DiaryRepository {}

main() {
  final diaryRepository = DiaryRepositoryMock();
  final usecase = GetDiariesCase(diaryRepository);

  test('should return a list of Diary', () async {
    when(diaryRepository.getDiaries(any))
        .thenAnswer((_) async => Right(<Diary>[]));

    final result = await usecase(1);
    expect(result | null, isA<List<Diary>>());
  });

  test('should return invalid user id error when user id is invalid', () async {
    when(diaryRepository.getDiaries(any))
        .thenAnswer((_) async => Right(<Diary>[]));

    var result = await usecase(null);
    expect(result.fold(id, id), isA<InvalidUserIdError>());
  });
}
