import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:dailypet/modules/diary/data/datasources/diary_datasource.dart';
import 'package:dailypet/modules/diary/data/repositories/diary_repository_impl.dart';
import 'package:dailypet/modules/diary/data/models/diary_model.dart';
import 'package:dailypet/modules/diary/domain/entities/diary.dart';
import 'package:dailypet/modules/diary/domain/errors/DatasourceError.dart';

class DiaryDatasourceMock extends Mock implements DiaryDatasource {}

main() {
  final datasource = DiaryDatasourceMock();
  final repository = DiaryRepositoryImpl(datasource);

  test('Should return a list of DiaryDatasource', () async {
    when(datasource.getDiaries(any)).thenAnswer((_) async => <DiaryModel>[]);

    final result = await repository.getDiaries(1);

    expect(result | null, isA<List<Diary>>());
  });

  test('Should return a Datasource error when datasource fail', () async {
    when(datasource.getDiaries(any)).thenThrow(Exception());

    final result = await repository.getDiaries(1);

    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
