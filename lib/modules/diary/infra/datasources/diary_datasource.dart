import 'package:dailypet/modules/diary/infra/models/diary_model.dart';

abstract class DiaryDatasource {
  Future<List<DiaryModel>> getDiaries(int userId);
}
