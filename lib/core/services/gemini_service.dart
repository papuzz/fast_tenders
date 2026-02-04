import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  final GenerativeModel _model;

  GeminiService(String apiKey)
    : _model = GenerativeModel(model: 'gemini-3-flash-preview', apiKey: apiKey);

  Future<String> summarizeTender(String tenderText) async {
    if (tenderText.trim().length < 10) {
      print('Gemini: Text too short to summarize (${tenderText.length} chars)');
      return 'The tender description is too short to generate a summary.';
    }

    final prompt =
        '''
Extract the key details from the following tender text. Provide a concise summary including the organization name, the specific project scope, the location, and all critical deadlines (Bid Conference, Enquiry Closing, and Submission Deadline). Keep the tone professional and the length under 60 words.

Tender Text:
$tenderText
''';

    try {
      print(
        'Gemini: Attempting summary with gemini-2.0-flash (Text length: ${tenderText.length})',
      );
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      if (response.text != null) return response.text!;
      throw Exception('Empty response from gemini-2.0-flash');
    } catch (e) {
      print('Gemini Error: $e');
      return 'AI Summary is currently unavailable. Please try again later.';
    }
  }
}

final geminiServiceProvider = Provider<GeminiService>((ref) {
  final apiKey = dotenv.get('GEMINI_API_KEY');
  return GeminiService(apiKey);
});
