import 'dart:io';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../model/voice_model.dart';

class Dialogue {
  final String speaker;
  final String text;

  Dialogue(this.speaker, this.text);
}

class PodcastProvider extends ChangeNotifier {
  final AudioPlayer _player =AudioPlayer();
  String? _currentTitle;
  List<String>? _currentPath;
  bool _isPlaying = false;
  String? _generatedScript;
  VoiceModel? _selectedHostVoice;
  VoiceModel? _selectedGuestVoice;
  File? _finalAudioFile;
  List<File> _audioFiles = [];
  bool _isGenerating = false;
  AudioPlayer get player => _player;
  String? get currentTitle => _currentTitle;
  bool get isPlaying => _isPlaying;
  String? get generatedScript => _generatedScript;
  VoiceModel? get selectedHostVoice => _selectedHostVoice;
  VoiceModel? get selectedGuestVoice => _selectedGuestVoice;
  File? get finalAudioFile => _finalAudioFile;
  List<File> get audioFiles => _audioFiles;
  bool get isGenerating => _isGenerating;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  List<String>? get currentPath => _currentPath;

  Duration get duration => _duration;
  Duration get position => _position;


  Future<void> playNewPodcast(String title, List<String> paths) async {
    try {
      await _player.stop();
  _currentPath = paths;
  _currentTitle = title;

  final sources = <AudioSource>[];
  Duration totalD = Duration.zero;

  for (var path in paths) {
    if (File(path).existsSync()) {
      final source = AudioSource.file(path);
      sources.add(source);

      final tempPlayer = AudioPlayer();
      final d = await tempPlayer.setAudioSource(source);
      if (d != null) totalD += d;
      await tempPlayer.dispose();
    }
  }

  if (sources.isEmpty) return;

  _duration = totalD;
  notifyListeners();

  await _player.setAudioSource(ConcatenatingAudioSource(children: sources));
  _player.play();

  _player.positionStream.listen((p) {
    int currentIndex = _player.currentIndex ?? 0;
    Duration acc = Duration.zero;

    _position = p;
    notifyListeners();
  });

  } catch (e) {
    print("DEBUG: Error: $e");
  }
  }
  void stopAndClear() {
    _player.stop();
    _currentTitle = null;
    _currentPath = null;
    _isPlaying = false;
    _position = Duration.zero;
    _duration = Duration.zero;

    notifyListeners();
  }
  void togglePlay() {
    if(_player.playing){
      _player.pause();
    }else{
      _player.play();
    }notifyListeners();
  }
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
