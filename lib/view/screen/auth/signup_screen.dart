import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/constants.dart';
import 'package:tiktok/view/screen/auth/login_screen.dart';
import 'package:tiktok/view/widgets/text_input_field.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Flip Share",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: buttonColor,
                  ),
                ),
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                      backgroundColor: Colors.black,
                    ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () {
                          authController.pick_image();
                        },
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 21),
                  child: TextInputField(
                    controller: _usernamecontroller,
                    labeltext: "Username",
                    icon: Icons.person,
                    isobscure: false,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 21),
                  child: TextInputField(
                    controller: _emailcontroller,
                    labeltext: "Email",
                    icon: Icons.email,
                    isobscure: false,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 21),
                  child: TextInputField(
                    controller: _passwordcontroller,
                    labeltext: "Password",
                    icon: Icons.lock,
                    isobscure: true,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      authController.registerUser(
                          _usernamecontroller.text,
                          _emailcontroller.text,
                          _passwordcontroller.text,
                          authController.profielphoto);
                    },
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.offAll(LoginScreen());
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: buttonColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
