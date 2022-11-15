import 'package:ask_watson_app/src/data/repository/category_repository_impl.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';

class CategoryUseCase {
  
  final CategoryRepositoryImpl _repository;

  CategoryUseCase(this._repository);

  // 카테고리 리스트 조회
  Future<Map<ApiResponse, dynamic>> getCategoryList() async {
    var result = await _repository.getCategoryList();
    return result;
  }
}