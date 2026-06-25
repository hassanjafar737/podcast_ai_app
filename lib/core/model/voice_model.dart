class VoiceModel {
  final String voiceId;
  final String name;
  final String image; // Added image field

  VoiceModel({required this.name, required this.voiceId, required this.image});

  factory VoiceModel.fromJson(Map<String, dynamic> json) {
    return VoiceModel(
      name: json['name'] ?? "",
      voiceId: json['voice_id'] ?? "",
      image: "assets/images/elena1.png",
    );
  }

  factory VoiceModel.fromTopMedia(Map<String, dynamic> json) {
    return VoiceModel(
      name: json['name'] ?? json['speaker_name'] ?? "Unknown Voice",
      voiceId: json['speaker'] ?? json['speaker_id'] ?? "",
      image: "assets/images/elena1.png",
    );
  }
}
