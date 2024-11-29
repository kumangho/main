import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grecipe/src/ui/view/intro_view/signin_page.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final authResult = await _auth.signInWithCredential(credential);

      final User? user = authResult.user;
      assert(!user!.isAnonymous);
      final User? currentUser = _auth.currentUser;
      assert(user!.uid == currentUser!.uid);
      Get.to(const SignInPage(),
          transition: Transition.cupertino); // navigate to your wanted page
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logoutGoogle() async {
    await googleSignIn.signOut();
    Get.back(); // navigate to your wanted page after logout.
  }
}
