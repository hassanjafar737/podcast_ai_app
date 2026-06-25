import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../model/voice_model.dart';

class ElevenServices {
  static const String _apiKey = "sk_ffe7d2b94fd1fe1f13da85fc6fe775b2b73820ee1f3bfa0b";

  static Future<List<VoiceModel>> getVoices() async {
    print("DEBUG: Fetching voices from ElevenLabs...");
    try {
      final response = await http.get(
        Uri.parse("https://api.elevenlabs.io/v1/voices"),
        headers: {
          "xi-api-key": _apiKey,
          "Content-Type": "application/json",
        },
      );

      print("DEBUG: GetVoices Status: ${response.statusCode}");
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List voicesData = data['voices'] ?? [];
        for (var v in voicesData) {
          print("VOICE FOUND: ${v['name']} (Category: ${v['category']})");
        }
        return voicesData.map((v) => VoiceModel.fromJson(v)).toList();
      } else {
        print("ElevenLabs GetVoices Error: ${response.body}");
        return [];
      }
    } catch (e) {
      print("ElevenLabs GetVoices Exception: $e");
      return [];
    }
  }

  static List<Map<String, String>> parseScript(String script) {
    final lines = <Map<String, String>>[];

    for (var line in script.split("\n")) {
      line = line.replaceAll("*", "").trim();
      if (line.isEmpty) continue;

      final upper = line.toUpperCase();
      String speaker = "";
      String text = "";

      if (upper.startsWith("HOST")) {
        speaker = "HOST";
        text = line.substring(4).trim();
      } else if (upper.startsWith("GUEST")) {
        speaker = "GUEST";
        text = line.substring(5).trim();
      } else {
        continue;
      }

      if (text.startsWith(":")) {
        text = text.substring(1).trim();
      }

      if (text.isNotEmpty) {
        lines.add({"speaker": speaker, "text": text});
      }
    }

    return lines;
  }

  static Future<List<String>> generateDialogueAudio(
    String script,
    String hostVoiceId,
    String guestVoiceId,
  ) async {
    final lines = parseScript(script);
    final audioPaths = <String>[];

    for (var i = 0; i < lines.length; i++) {
      final speaker = lines[i]["speaker"]!;
      final text = lines[i]["text"]!;
      final voiceId = speaker == "HOST" ? hostVoiceId : guestVoiceId;

      final path = await textTospeech(voiceId, text, index: i);
      if (path != null) {
        audioPaths.add(path);
      }
    }

    return audioPaths;
  }

  static Future<String?> textTospeech(
    String voiceId,
    String text, {
    int index = 0,
  }) async {
    print("DEBUG: ElevenLabs TTS called with voiceId: $voiceId");
    try {
      final response = await http.post(
        Uri.parse("https://api.elevenlabs.io/v1/text-to-speech/$voiceId"),
        headers: {
          "xi-api-key": _apiKey,
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "text": text,
          "model_id": "eleven_multilingual_v2",
          "voice_settings": {
            "stability": 0.5,
            "similarity_boost": 0.5
          }
        }),
      ).timeout(const Duration(seconds: 60));

      if (response.statusCode == 200) {
        final directory = await getTemporaryDirectory();
        final filePath = "${directory.path}/podcast_audio_$index.mp3";

        final file = File(filePath);
        if (await file.exists()) await file.delete();
        await file.writeAsBytes(response.bodyBytes);

        print("DEBUG: Audio saved successfully at: $filePath");
        return filePath;
      } else {
        print("DEBUG: ElevenLabs TTS Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("DEBUG: ElevenLabs Exception: $e");
      return null;
    }
  }
  static Future<bool>addVoices(String name,String filePath)async{
    try{
       var request = http.MultipartRequest(
         'POST',
         Uri.parse("https://api.elevenlabs.io/v1/voices/add")
       );
       request.headers.addAll({"xi-api-key": _apiKey,});
       request.fields['name']=name;
       request.fields['description']="Cloned via VOX AI App";
       request.files.add(await http.MultipartFile.fromPath("files", filePath));
       var response=await request.send();
       if(response.statusCode==200){
         print("DEBUG: Voice Cloned Successfully!");
         return true;

       }else{
         final resBody=await response.stream.bytesToString();
         print("DEBUG: Voice Cloned Successfully!");
         return false;
       }
    }catch(e){
      print("DEBUG: Exception in addVoice: $e");
      return false;
    }

  }
}
