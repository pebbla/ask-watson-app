import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';

abstract class CategoryRepository {

  // 카테고리 리스트 조회
  Future<Map<ApiResponse, dynamic>> getCategoryList();

}