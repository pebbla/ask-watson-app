enum ApiStatus {
  Success,
  Error,
  Forbidden,
  NotFound,
  NotAcceptable,
  MethodNotAllowed,
  Conflict,
  UnprocessableEntity,
  InterverServerError,
}


class ApiStatusHelper {
  static ApiStatus convertApiStatus(int statusCode) {
    switch (statusCode) {
      case 200:
      case 201:
      case 202:
        return ApiStatus.Success;
      case 403:
        return ApiStatus.Forbidden;
      case 404:
        return ApiStatus.NotFound;
      case 406:
        return ApiStatus.NotAcceptable;
      case 405:
        return ApiStatus.MethodNotAllowed;
      case 409:
        return ApiStatus.Conflict;
      case 422:
        return ApiStatus.UnprocessableEntity;
      case 500:
        return ApiStatus.InterverServerError;
      default:
        return ApiStatus.Error;
    }
  }
}
