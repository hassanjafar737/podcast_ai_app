import 'dart:io';
import 'package:flutter/material.dart';
import '../model/voice_model.dart';

class Dialogue {
  final String speaker; // "host" or "guest"
  final String text;

  Dialogue(this.speaker, this.text);
}

class PodcastProvider extends ChangeNotifier {
  String? _generatedScript;
  VoiceModel? _selectedHostVoice;
  VoiceModel? _selectedGuestVoice;
  File? _finalAudioFile;
  List<File> _audioFiles = [];
  bool _isGenerating = false;

  String? get generatedScript => _generatedScript;
  VoiceModel? get selectedHostVoice => _selectedHostVoice;
  VoiceModel? get selectedGuestVoice => _selectedGuestVoice;
  File? get finalAudioFile => _finalAudioFile;
  List<File> get audioFiles => _audioFiles;
  bool get isGenerating => _isGenerating;

  void setScript(String script) {
    _generatedScript = script;
    notifyListeners();
  }

  void setHostVoice(VoiceModel voice) {
    _selectedHostVoice = voice;
    notifyListeners();
  }

  void setGuestVoice(VoiceModel voice) {
    _selectedGuestVoice = voice;
    notifyListeners();
  }

  void setFinalAudio(File file) {
    _finalAudioFile = file;
    notifyListeners();
  }

  void setAudioFiles(List<File> files) {
    _audioFiles = files;
    notifyListeners();
  }

  void setGenerating(bool value) {
    _isGenerating = value;
    notifyListeners();
  }

  void clear() {
    _generatedScript = null;
    _selectedHostVoice = null;
    _selectedGuestVoice = null;
    _finalAudioFile = null;
    _audioFiles = [];
    _isGenerating = false;
    notifyListeners();
  }
}
