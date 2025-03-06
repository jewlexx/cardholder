import 'package:cardholder/api/v0.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock/http_v0.dart';

void main() {
  test('API is parsed successfully', () async {
    final apiClient = MockV0Client();

    when(() => apiClient.getApiV0Json()).thenAnswer((_) async => apiData);

    final api = API.fromRawJson(await apiClient.getApiV0Json());

    expect(api.cards.length, 2);
    expect(api.cards['flybuys']?.displayName, 'Flybuys');
    expect(
      api.cards['flybuys']?.imageUrl,
      'https://upload.wikimedia.org/wikipedia/en/thumb/5/59/Flybuys_%28Australia%29_logo.svg/1280px-Flybuys_%28Australia%29_logo.svg.png',
    );
    expect(api.cards['kmart']?.displayName, 'Kmart');
    expect(
      api.cards['kmart']?.imageUrl,
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Kmart_Australia_logo.svg/1280px-Kmart_Australia_logo.svg.png',
    );
  });
}
