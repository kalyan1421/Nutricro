import 'dart:io';

import 'package:diettest2/auth_controllers/signup_controller.dart';
import 'package:diettest2/auth_controllers/UI/loginscreen.dart';
import 'package:diettest2/pages/Profile_page.dart';
import 'package:diettest2/screens/round_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignUpController _signUpController = SignUpController();

  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();
  final confirmController = TextEditingController();

  final emailFocusNode = FocusNode();
  final fullnameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    fullnameController.dispose();
    confirmController.dispose();
  }

  File? profileImage;
  final picker = ImagePicker();
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.center,
                    height: 230,
                    // width: 300,
                    child: Image.asset(
                      "assets/utiles/signup_icon.jpg",
                      scale: 7,
                      // color: Colors.green
                      // color: Colors.green,
                    ),
                  ),

                  // ElevatedButton(
                  //   onPressed: _pickImage,
                  //   child: Text('Pick Profile Image'),
                  // ),
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //     icon: Icon(
                  //       Icons.arrow_back,
                  //       size: 25,
                  //     )),
                  // const SizedBox(height: 20),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Let's Get Started!",
                          style: GoogleFonts.robotoSlab(
                              fontSize: 34,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Create an account to Nutrition Diet to get all features",
                          style: GoogleFonts.robotoSlab(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  // SizedBox(height: height*0.2,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formkey,
                      child: Column(children: [
                        const SizedBox(height: 10),
                        if (profileImage != null)
                          Container(
                            width: 120,
                            height: 120,
                            child: Stack(children: [
                              Positioned(
                                bottom: 0,
                                child: Image.file(
                                  profileImage!,
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                  right: 10,
                                  top: 10,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      size: 30,
                                      color: Colors.green,
                                    ),
                                    onPressed: _pickImage,
                                  )),
                            ]),
                          )
                        else
                          InkWell(
                            onTap: _pickImage,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  // shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.green, width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade200,
                                        offset: Offset(1, 3),
                                        spreadRadius: 5,
                                        blurRadius: 5)
                                  ]),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.green,
                                size: 40,
                              ),
                            ),
                          ),

                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: fullnameController,
                          decoration: const InputDecoration(
                            hintText: "Full Name",
                            hintStyle: TextStyle(color: Colors.grey),
                            helperText: "Enter Full name",
                            prefixIcon: Icon(
                              Icons.person,
                              size: 22,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey),
                            helperText: "Enter email e.g XX@gmail.com",
                            prefixIcon: Icon(
                              Icons.mail,
                              size: 22,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.visibility),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            helperText:
                                "Enter Password with minumum 5 characters",
                            prefixIcon: Icon(
                              Icons.lock_open,
                              size: 22,
                            ),
                            // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Password';
                            }
                            return null;
                          },
                        )
                      ]),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: RoundButton(
                      loading: loading,
                      title: 'Sign Up',
                      ontap: () async {
                        if (_formkey.currentState!.validate()) {
                          // provider.
                          // signup(context , fullnameController.text, emailController.text, passwordController.text);
                          _signUpController.signup(
                              context,
                              fullnameController.text,
                              emailController.text,
                              passwordController.text,
                              profileImage!);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have an account?",
                          style: TextStyle(color: Colors.grey, fontSize: 16)),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text("Login",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 16)))
                    ],
                  ),
                ],
              )),
        ));
  }
  // ),
  // )
  // )
  // )
  // );
}
