import 'package:cardholder/api/v0.dart';
import 'package:mocktail/mocktail.dart';

const apiData = """
{
  "flybuys": {
    "displayName": "Flybuys",
    "imageUrl": "https://upload.wikimedia.org/wikipedia/en/thumb/5/59/Flybuys_%28Australia%29_logo.svg/1280px-Flybuys_%28Australia%29_logo.svg.png"
  },
  "kmart": {
    "displayName": "Kmart",
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Kmart_Australia_logo.svg/1280px-Kmart_Australia_logo.svg.png"
  }
}
""";

class MockV0Client extends Mock implements V0Client {}
