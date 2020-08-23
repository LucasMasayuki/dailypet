import 'package:dailypet/modules/diary/domain/interfaces/failure_get_diaries.dart';

class DatasourceError implements FailureGetDiaries {
  final String message;

  DatasourceError(this.message);
}
