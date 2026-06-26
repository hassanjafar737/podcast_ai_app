import 'package:appwrite/appwrite.dart';
import 'package:podcast_ai_app/core/services/appwrite_service.dart';

class AuthServices {
  Future<void>signup({
    required String name,
    required String email,
    required String password,
})async{
    await AppWriteServices.account.create(
        userId: ID.unique(), email: email, password: password,name: name);
  }
  Future <void>login({
    required String email,
    required String password,
})async{
    await AppWriteServices.account.createEmailPasswordSession(email: email, password: password);
  }

  Future<bool> isLoggedIn() async {
    try {
      await AppWriteServices.account.get();
      return true;
    } catch (e) {
      return false;
    }
  }
  Future<void> logout()async{
    try{
      await AppWriteServices.account.deleteSession(sessionId:"current");
      print("User logged out successfully");
    }catch(e){
      print("Logout Error: $e");
    }
  }

}