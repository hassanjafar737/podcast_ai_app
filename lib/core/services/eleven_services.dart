import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../model/voice_model.dart';

class ElevenServices {
  static const String _apiKey = "f8cf576e7b9e4126af176432add171e7";

  static Future<List<VoiceModel>> getVoices() async {
    print("DEBUG: Fetching voices from TopMediai (voices_list)...");
    try {
      final response = await http.get(
        Uri.parse("https://api.topmediai.com/v1/voices_list"),
        headers: {"x-api-key": _apiKey},
      );

      print("DEBUG: GetVoices Status: ${response.statusCode}");
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        // Screenshot ke mutabiq keys "Voice" ya "data" ho sakti hain
        List? speakers;
        if (data is Map) {
          speakers = data['Voice'] ?? data['data'] ?? data['voices'];
        } else if (data is List) {
          speakers = data;
        }

        if (speakers != null) {
          return speakers.map((item) => VoiceModel.fromTopMedia(item)).toList();
        } else {
          print("DEBUG: No voice list found in response: ${response.body}");
          return [];
        }
      } else {
        print("TopMediai GetVoices Error: ${response.body}");
        return [];
      }
    } catch (e) {
      print("TopMediai GetVoices Exception: $e");
      return [];
    }
  }

  static Future<String?> textTospeech(String voiceId, String text) async {
    print("DEBUG: TopMediai TTS called with voiceId: $voiceId");
    try {
      final response = await http.post(
        Uri.parse("https://api.topmediai.com/v1/text2speech"),
        headers: {
          "x-api-key": _apiKey,
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "text": text,
          "speaker": voiceId,
          "format": "wav", // Changed to wav for better compatibility
        }),
      ).timeout(const Duration(seconds: 50));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['data'] != null && data['data']['oss_url'] != null) {
          final String audioUrl = data['data']['oss_url'];
          print("DEBUG: Downloading audio from: $audioUrl");

          final audioResponse = await http.get(Uri.parse(audioUrl));
          final directory = await getTemporaryDirectory();
          
          // Extension dynamic nikaal rahe hain taake wav/mp3 ka masla na ho
          String extension = audioUrl.split('.').last.split('?').first;
          final filePath = "${directory.path}/podcast_audio.$extension";

          final file = File(filePath);
          if (await file.exists()) await file.delete();
          await file.writeAsBytes(audioResponse.bodyBytes);

          print("DEBUG: Audio saved successfully at: $filePath");
          return filePath;
        } else {
          print("DEBUG: TopMediai returned no URL. Body: ${response.body}");
          return null;
        }
      } else {
        print("DEBUG: TopMediai TTS Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("DEBUG: TopMediai Exception: $e");
      return null;
    }
  }
}
