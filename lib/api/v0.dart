import 'dart:convert';

class V0Client {
  const V0Client();

  Future<String> getApiV0() async {
    return "TODO";
    // return apiData;
  }
}

class API {
  final Map<String, CardType> cards;

  const API({required this.cards});

  factory API.fromRawJson(String str) => API.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory API.fromJson(Map<String, dynamic> json) {
    return API(
      cards: json.map((key, value) => MapEntry(key, CardType.fromJson(value))),
    );
  }

  Map<String, dynamic> toJson() => cards;
}

class CardType {
  final String displayName;
  final String imageUrl;

  CardType({required this.displayName, required this.imageUrl});

  factory CardType.fromRawJson(String str) =>
      CardType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CardType.fromJson(Map<String, dynamic> json) =>
      CardType(displayName: json["displayName"], imageUrl: json["imageUrl"]);

  Map<String, dynamic> toJson() => {
    "displayName": displayName,
    "imageUrl": imageUrl,
  };
}
