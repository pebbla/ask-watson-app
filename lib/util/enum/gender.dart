enum Gender {
  women,
  men,
}

extension GenderExtens on Gender {
  String get convertString {
    switch (this) {
      case Gender.women:
        return "F";
      case Gender.men:
        return "M";
    }
  }
}
