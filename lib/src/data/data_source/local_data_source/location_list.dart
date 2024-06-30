import 'dart:convert';

import 'package:ask_watson_app/src/data/model/location.dart';

String _jsonData = '''[
    {
      "id": 1,
      "state": "서울",
      "city": "강남"
    },
    {
      "id": 2,
      "state": "서울",
      "city": "홍대"
    },
    {
      "id": 3,
      "state": "서울",
      "city": "신촌"
    },
    {
      "id": 4,
      "state": "서울",
      "city": "건대"
    },
    {
      "id": 5,
      "state": "서울",
      "city": "대학로"
    },
    {
      "id": 6,
      "state": "서울",
      "city": "강북"
    },
    {
      "id": 7,
      "state": "서울",
      "city": "신림"
    },
    {
      "id": 8,
      "state": "서울",
      "city": "기타"
    },
    {
      "id": 9,
      "state": "경기",
      "city": "부천"
    },
    {
      "id": 10,
      "state": "경기",
      "city": "일산"
    },
    {
      "id": 11,
      "state": "경기",
      "city": "수원"
    },
    {
      "id": 12,
      "state": "경기",
      "city": "안양"
    },
    {
      "id": 13,
      "state": "경기",
      "city": "기타"
    },
    {
      "id": 14,
      "state": "인천",
      "city": "기타"
    },
    {
      "id": 15,
      "state": "충청",
      "city": "대전"
    },
    {
      "id": 16,
      "state": "충청",
      "city": "천안"
    },
    {
      "id": 17,
      "state": "충청",
      "city": "청주"
    },
    {
      "id": 18,
      "state": "충청",
      "city": "기타"
    },
    {
      "id": 19,
      "state": "경상",
      "city": "대구"
    },
    {
      "id": 20,
      "state": "경상",
      "city": "부산"
    },
    {
      "id": 21,
      "state": "경상",
      "city": "기타"
    },
    {
      "id": 22,
      "state": "전라",
      "city": "전주"
    },
    {
      "id": 23,
      "state": "전라",
      "city": "광주"
    },
    {
      "id": 24,
      "state": "전라",
      "city": "기타"
    },
    {
      "id": 25,
      "state": "강원",
      "city": "기타"
    },
    {
      "id": 26,
      "state": "제주",
      "city": "기타"
    }
  ]''';

List<Location> location_list = jsonDecode(_jsonData).map<Location>((item) => Location.fromJson(item)).toList();