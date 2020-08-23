import 'package:dailypet/modules/diary/data/datasources/diary_datasource.dart';
import 'package:dailypet/modules/diary/domain/errors/DatasourceError.dart';
import 'package:dailypet/modules/diary/domain/interfaces/failure_get_diaries.dart';
import 'package:dailypet/modules/diary/domain/entities/diary.dart';
import 'package:dailypet/modules/diary/domain/repositories/diary_repository.dart';
import 'package:dartz/dartz.dart';

class DiaryRepositoryImpl implements DiaryRepository {
  final DiaryDatasource diaryDatasource;

  DiaryRepositoryImpl(this.diaryDatasource);

  @override
  Future<Either<FailureGetDiaries, List<Diary>>> getDiaries(int userId) async {
    try {
      final result = await diaryDatasource.getDiaries(userId);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError('Error on get diaries.'));
    }
  }
}
