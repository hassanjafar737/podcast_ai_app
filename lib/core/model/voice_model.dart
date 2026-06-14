class VoiceModel {
  final String voiceId;
  final String name;

  VoiceModel({required this.name, required this.voiceId});

  factory VoiceModel.fromJson(Map<String, dynamic> json) {
    return VoiceModel(
      name: json['name'] ?? "",
      voiceId: json['voice_id'] ?? "",
    );
  }

  factory VoiceModel.fromTopMedia(Map<String, dynamic> json) {
    // Screenshot ke mutabiq keys "name" aur "speaker" hain
    return VoiceModel(
      name: json['name'] ?? json['speaker_name'] ?? "Unknown Voice",
      voiceId: json['speaker'] ?? json['speaker_id'] ?? "",
    );
  }
}
