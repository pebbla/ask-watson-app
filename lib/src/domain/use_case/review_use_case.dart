import 'package:ask_watson_app/src/data/model/review.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';

class ReviewUseCase {
  final ReviewUseCase _repository;

  ReviewUseCase(this._repository);

  // 리뷰 단건 조회
  Future<Map<ApiResponse, dynamic>> getReivewById(int reviewId) {
    var result = _repository.getReivewById(reviewId);
    return result;
  }

  // 테마별 리뷰 조회
  Future<Map<ApiResponse, dynamic>> getReivewByThemeId(int themeId) {
    var result = _repository.getReivewByThemeId(themeId);
    return result;
  }

  // 유저별 리뷰 조회
  Future<Map<ApiResponse, dynamic>> getReivewByUserId(int userId) {
    var result = _repository.getReivewByUserId(userId);
    return result;
  }

  // 리뷰 등록
  Future<Map<ApiResponse, dynamic>> createReview(
      int userId, int themeId, Review review) {
    var result = _repository.createReview(userId, themeId, review);
    return result;
  }

  // 리뷰 수정
  Future<Map<ApiResponse, dynamic>> updateReview(Review review) {
    var result = _repository.updateReview(review);
    return result;
  }

  // 리뷰 삭제
  Future<Map<ApiResponse, dynamic>> deleteReview(int reviewId) {
    var result = _repository.deleteReview(reviewId);
    return result;
  }
}
