class Category {
  int? id;
  String? name;
  String? imageUrl;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['categoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['categoryName'] = name;
    return data;
  }

  String getImageUrl(){
    String prefix = 'assets/category/';
    late String categoryName;
    String suffix = '.png';

    switch (name) {
      case '스릴러':
        categoryName = 'thriller';
        break;
      case 'SF':
        categoryName = 'sf';
        break;
      case '추리':
        categoryName = 'reasoning';
        break;
      case '공포':
        categoryName = 'fear';
        break;
      case '코미디':
        categoryName = 'comedy';
        break;
      case '로맨스':
        categoryName = 'romance';
        break;
      case '판타지':
        categoryName = 'fantasy';
        break;
      case '야외':
        categoryName = 'outdoor';
        break;
      case '19금':
        categoryName = 'erotic';
        break;
      case '감성':
        categoryName = 'emotion';
        break;
      case '방털기':
        categoryName = 'robbery';
        break;
      case '물음표':
        categoryName = '?';
        break;
      default:
        categoryName = '?';
    }
    return prefix + categoryName + suffix;
  
  }
}