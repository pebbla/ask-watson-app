import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/http_client.dart';
import 'package:ask_watson_app/src/data/model/category.dart';
import 'package:ask_watson_app/src/domain/repository/category_repository.dart';


class CategoryRepositoryImpl extends CategoryRepository {

  final HttpClient _httpClient = HttpClient();

  // 카테고리 리스트 조회
  @override
  Future<Map<ApiResponse, dynamic>> getCategoryList() async {
    var response = await _httpClient.getRequest('/categories');
    if(response[ApiResponse.Result] == ApiStatus.Success) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Category>((json) => Category.fromJson(json)).toList();
    }
    return response;
  }

}