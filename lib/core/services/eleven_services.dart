import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/voice_model.dart';
class ElevenServices {
 static Future<List<VoiceModel>>getVoices()async{
    final response = await http.get(Uri.parse("https://api.elevenlabs.io/v2/voices"),
    headers: {
    "xi-api-key":"sk_ff4dc222b556a23aa02c67ea742f97f9122f5501d7933ebb"
    }
    );
    final data = jsonDecode(response.body);
    final voices = data["voices"] as List;
    return voices.map((item)=>VoiceModel.fromJson(item),
    ).toList();
  }
}
