import 'dart:isolate';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok/view/screen/auth/login_screen.dart';
import 'package:tiktok/view/screen/auth/signup_screen.dart';
import 'package:tiktok/view/screen/home_screen.dart';
import 'dart:io';
import '../model/user.dart' as model;
import 'package:tiktok/constants.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<File?> _pickedImage;
  late Rx<User?> _user;
  File? get profielphoto => _pickedImage.value;
  User? get user => _user.value;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setinitialscreen);
  }

  _setinitialscreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      print(user);
      Get.offAll(() => const HomeScreen());
    }
  }

  void pick_image() async {
    final ImagePicker _picker = ImagePicker();
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have succesfully selected your profile picture!');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('ProfilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask tsk = ref.putFile(image);
    TaskSnapshot snap = await tsk;
    Future<String> dowloadurl = snap.ref.getDownloadURL();
    return dowloadurl;
  }

  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadurl = await _uploadToStorage(image);
        model.User user = model.User(
            email: email,
            name: username,
            uid: cred.user!.uid,
            profilePhoto: downloadurl);
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        Get.snackbar('Creating Account', 'Succefully Created your account');
      } else {
        Get.snackbar('Error Creating Account', 'Please Enter All the field');
      }
    } catch (e) {
      Get.snackbar('Error Creating Account', e.toString());
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        //Get.snackbar('Logging in', 'Please Enter All the field');
      } else {
        Get.snackbar('Error Logging in', 'Please Enter All the field');
      }
    } catch (e) {
      Get.snackbar('Error Logging in', e.toString());
    }
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }
}
