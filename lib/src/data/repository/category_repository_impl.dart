import 'package:ask_watson_app/src/data/data_source/http_client.dart';
import 'package:ask_watson_app/src/data/model/category.dart';
import 'package:ask_watson_app/src/domain/repository/category_repository.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';
import 'package:ask_watson_app/util/enum/api_status.dart';

class CategoryRepositoryImpl extends CategoryRepository {

  final HttpClient _httpClient = HttpClient();

  // 카테고리 리스트 조회
  @override
  Future<Map<ApiResponse, dynamic>> getCategoryList() async {
    var response = await _httpClient.getRequest('/categories');
    if(response[ApiResponse.Result] == ApiResult.Success) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Category>((json) => Category.fromJson(json)).toList();
    }
    return response;
  }

}