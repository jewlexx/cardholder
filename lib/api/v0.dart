import 'dart:convert';
import 'package:http/http.dart' as http;

const v0ApiUrl =
    "https://raw.githubusercontent.com/jewlexx/cardholder/refs/heads/trunk/api/v0.json";

class V0Client {
  const V0Client();

  Future<http.Response> getApiV0Raw() async {
    final url = Uri.parse(v0ApiUrl);

    return await http.get(url);
  }

  Future<String> getApiV0Json() async {
    final response = await getApiV0Raw();

    return response.body;
  }

  Future<API> getApiV0() async {
    final json = await getApiV0Json();

    return API.fromRawJson(json);
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
