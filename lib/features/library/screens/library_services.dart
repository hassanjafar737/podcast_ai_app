import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:podcast_ai_app/features/discover/widgets/filter_chip.dart';

class LibraryServices {
  static Future<File> _getLibraryFile()async{
    final directory=await getApplicationDocumentsDirectory();
     return File("${directory.path}/my_library.json");

  }
  static Future<void> savePodcast({
    required String title,
    required List<String>audioPaths,
    required String voiceName,

})async{
    final file =await _getLibraryFile();
    List podcasts=[];
    if(await file.exists()){
      final content = await file.readAsString();
      podcasts = jsonDecode(content);
    }podcasts.add({
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'title': title,
      'paths': audioPaths,
      'voice': voiceName,
      'date': DateTime.now().toString(),
      'isFavorite': false,
    });

    await file.writeAsString(jsonEncode(podcasts));
    print("DEBUG: Saved to Library!");

  }
  static Future<List> getPodcasts() async {
    final file = await _getLibraryFile();
    if (!await file.exists()) return [];
    final content = await file.readAsString();
    return jsonDecode(content);
  }
}