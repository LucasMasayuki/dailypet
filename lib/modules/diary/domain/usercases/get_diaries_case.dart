import 'package:dartz/dartz.dart';
import 'package:dailypet/modules/diary/domain/repositories/diary_repository.dart';
import 'package:dailypet/modules/diary/domain/entities/diary.dart';
import 'package:dailypet/modules/diary/domain/interfaces/failure_get_diaries.dart';
import 'package:dailypet/modules/diary/domain/interfaces/get_diaries.dart';
import 'package:dailypet/modules/diary/domain/errors/InvalidUserIdError.dart';

class GetDiariesCase implements GetDiaries {
  final DiaryRepository diaryRepository;

  GetDiariesCase(this.diaryRepository);

  @override
  Future<Either<FailureGetDiaries, List<Diary>>> call(int userId) async {
    if (userId == null) {
      return Left(InvalidUserIdError());
    }

    return diaryRepository.getDiaries(userId);
  }
}
