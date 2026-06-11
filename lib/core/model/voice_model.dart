class VoiceModel {

  final String voiceId;
  final String name;
  VoiceModel({required this.name,required this.voiceId});
  factory VoiceModel.fromJson(Map<String,dynamic>json){
    return VoiceModel(name: json['name'], voiceId: json["voice_id"]);
  }
}