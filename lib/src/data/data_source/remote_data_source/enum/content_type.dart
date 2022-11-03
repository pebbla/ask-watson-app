enum ContentType { Json, Form, Plain }

extension ContentTypeExtension on ContentType {
  String get convertedText {
    switch (this) {
      case ContentType.Json:
        return "application/json";
      case ContentType.Form:
        return "application/x-www-form-urlencoded";
      default:
        return "text/plain";
    }
  }
}