import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/http_client.dart';
import 'package:ask_watson_app/src/data/model/review.dart';
import 'package:ask_watson_app/src/domain/repository/reivew_repository.dart';

class ReivewRepositoryImpl extends ReivewRepository {

  final HttpClient _httpClient = HttpClient();

  //TODO : test
  
  // 리뷰 단건 조회
  @override
  Future<Map<ApiResponse, dynamic>> getReivewById(int reviewId) async {
    var response = await _httpClient.getRequest('​/reviews​/${reviewId}');
    if(response[ApiResponse.Status] == ApiStatus.Success) {
      response[ApiResponse.Data] = Review.fromJson(response[ApiResponse.Data]);
    }
    return response;
  }


  // 테마별 리뷰 조회
  @override
  Future<Map<ApiResponse, dynamic>> getReivewByThemeId(int themeId) async {
    var response = await _httpClient.getRequest('​/reviews​/theme​/${themeId}');
    if(response[ApiResponse.Status] == ApiStatus.Success) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Review>((json) => Review.fromJson(json)).toList();
    }
    return response;
  }


  // 유저별 리뷰 조회
  @override
  Future<Map<ApiResponse, dynamic>> getReivewByUserId(int userId) async {
    var response = await _httpClient.getRequest('​/user​/${userId}​/reviews');
    if(response[ApiResponse.Status] == ApiStatus.Success) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Review>((json) => Review.fromJson(json)).toList();
    }
    return response;
  }


  // 리뷰 등록
  @override
  Future<Map<ApiResponse, dynamic>> createReview(int userId, int themeId, Review review) async {
    var response = await _httpClient.postRequest('​/user​/${userId}​/themes​/${themeId}​/reviews', review.toJson());
    return response;
  }


  // 리뷰 수정
  @override
  Future<Map<ApiResponse, dynamic>> updateReview(Review review) async {
    var response = await _httpClient.postRequest('​/user​/reviews​/${review.id}', review.toJson());
    return response;
  }


  // 리뷰 삭제
  @override
  Future<Map<ApiResponse, dynamic>> deleteReview(int reviewId) async {
    var response = await _httpClient.deleteRequest('reviews​/${reviewId}');
    return response;
  }

}