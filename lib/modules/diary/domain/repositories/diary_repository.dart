import 'package:dartz/dartz.dart';
import 'package:dailypet/modules/diary/domain/entities/diary.dart';
import 'package:dailypet/modules/diary/domain/interfaces/failure_get_diaries.dart';

abstract class DiaryRepository {
  Future<Either<FailureGetDiaries, List<Diary>>> getDiaries(int userId) {}
}
