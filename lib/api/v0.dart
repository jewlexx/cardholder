import 'dart:convert';

class API {
  Map<String, CardType> cards;

  API({required this.cards});

  factory API.fromRawJson(String str) => API.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory API.fromJson(Map<String, dynamic> json) {
    if (json is Map<String, CardType>) {
      return API(cards: json);
    } else {
      throw Exception('CardType is not a Map<String, CardType>');
    }
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
