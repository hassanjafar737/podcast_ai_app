// // gemini_service.dart
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class GeminiService {
//   // Aapki AQ. wali key bilkul sahi hai, bas isi ko rehne dein
//   static const String apiKey = 'AQ.Ab8RN6KhK0aEWn5AQ3nB_ck4QwgNCo5d5sOJmsmPSf8v0gFW7w';
//
//   static Future<String> generatePodcastScript(String topic) async {
//     // CHANGE 1: 'v1' ko 'v1beta' karein
//     // CHANGE 2: 'gemini-1.5-flash' ko 'gemini-1.5-flash-latest' karein
//     final url = Uri.parse(
//       'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-8b:generateContent?key=$apiKey',
//     );
//
//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         "contents": [
//           {
//             "parts": [
//               {
//                 "text": "Generate a detailed podcast script between two hosts about: $topic"
//               }
//             ]
//           }
//         ]
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return data['candidates'][0]['content']['parts'][0]['text'];
//     }
//
//     // Agar error aaye to pura body print karein taaki pata chale masla kya hai
//     print("Error Code: ${response.statusCode}");
//     print("Error Message: ${response.body}");
//     throw Exception("Error: ${response.body}");
//   }
// }
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String apiKey = 'AQ.Ab8RN6JAdI4S4OnVJO6px856YLfBO6PffUzLf_gE_ctdl4utyA';

  static const String modelId = 'gemini-3.5-flash';

  static Future<String> generatePodcastScript(String topic) async {
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/$modelId:generateContent?key=$apiKey',
    );

    int retryCount = 0;
    const int maxRetries = 3;
    int waitSeconds = 4;

    while (retryCount <= maxRetries) {
      try {
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "contents": [
              {
                "parts": [
                  {
                    "text": """
Generate a short podcast script between Host and Guest.

Topic:
$topic

Rules:
1. Maximum 80 words total.
2. Only 2 Host dialogues.
3. Only 2 Guest dialogues.
4. Keep every dialogue under 15 words.
5. Do not add explanations.
6. Format exactly like this:

HOST: ...
GUEST: ...
HOST: ...
GUEST: ...

"""
                  }
                ]
              }
            ]
          }),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          return data['candidates'][0]['content']['parts'][0]['text'];
        }

        // Agar 503 (Server Busy) ya 429 (Rate Limit) aaye to retry karein
        if (response.statusCode == 503 || response.statusCode == 429) {
          if (retryCount < maxRetries) {
            print("Server busy or limit reached (Error ${response.statusCode}). Retrying in $waitSeconds seconds...");
            await Future.delayed(Duration(seconds: waitSeconds));
            retryCount++;
            waitSeconds *= 2;
            continue;
          }
        }

        // Agar 404 aaye to iska matlab hai model name ya URL version galat hai
        print("Final Error Code: ${response.statusCode}");
        print("Response Body: ${response.body}");
        throw Exception("Gemini API Error: ${response.statusCode}");

      } catch (e) {
        if (retryCount >= maxRetries) rethrow;
        retryCount++;
        await Future.delayed(Duration(seconds: waitSeconds));
      }
    }
    throw Exception("Failed to connect after retries.");
  }
}