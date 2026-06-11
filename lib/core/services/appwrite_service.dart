import 'package:appwrite/appwrite.dart';
class AppWriteServices {
  static final client = Client().setEndpoint('https://tor.cloud.appwrite.io/v1')
      .setProject('6a2017350036c635b79d');
  static final account= Account(client);
}