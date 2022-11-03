import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/model/review.dart';

abstract class ReivewRepository {

  // 리뷰 단건 조회
  Future<Map<ApiResponse, dynamic>> getReivewById(int reviewId);

  // 테마별 리뷰 조회
  Future<Map<ApiResponse, dynamic>> getReivewByThemeId(int themeId);

  // 유저별 리뷰 조회
  Future<Map<ApiResponse, dynamic>> getReivewByUserId(int userId);

  // 리뷰 등록
  Future<Map<ApiResponse, dynamic>> createReview(int userId, int themeId, Review review);

  // 리뷰 수정
  Future<Map<ApiResponse, dynamic>> updateReview(Review review);

  // 리뷰 삭제
  Future<Map<ApiResponse, dynamic>> deleteReview(int reviewId);
   
}