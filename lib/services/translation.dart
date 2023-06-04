import 'dart:convert';
import 'package:http/http.dart' as http;

class Translation {
  static const String API_KEY = 'AIzaSyBTMkGle70O2hl4onJ_1vlNQd4yUfJvjk0';

  static Future<String> translate(String text, String targetLanguage) async {
    final String encodedText = Uri.encodeComponent(text);
    final String url =
        'https://translation.googleapis.com/language/translate/v2?key=$API_KEY&source=en&target=$targetLanguage&q=$encodedText';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final translatedText = data['data']['translations'][0]['translatedText'];
      return translatedText;
    } else {
      throw Exception('Failed to translate text');
    }
  }
}
