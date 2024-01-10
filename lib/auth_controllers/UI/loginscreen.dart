// ignore_for_file: deprecated_member_use

import 'package:diettest2/screens/round_button.dart';
import 'package:diettest2/auth_controllers/UI/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:progress_dialog/progress_dialog.dart';
import '../../Dashscreen.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final auth = FirebaseAuth.instance;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> showCircularProgress() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }

    return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100),
                      Container(
                        height: 200,
                        child: Image.asset(
                          "assets/utiles/welcom_icon.jpg",
                          scale: 5,
                          // color: Colors.green,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome back!",
                              style: GoogleFonts.robotoSlab(
                                  fontSize: 34,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Login to your existant account of Nutrition Diet",
                              style: GoogleFonts.robotoSlab(
                                  fontSize: 15,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),

                      Form(
                        key: _formkey,
                        child: Column(children: [
                          // const Text("Login" ,style: TextStyle( fontWeight: FontWeight.bold,color: Color(0xFF004581) ,fontSize: 50),),
                          // const Text("Create an account, It's free", style: TextStyle(fontSize: 15,)),
                          const SizedBox(height: 30),
                          TextFormField(
                            focusNode: emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            onFieldSubmitted: (Value) {
                              Utils.fieldFoucs(
                                  context, emailFocusNode, passwordFocusNode);
                            },
                            decoration: const InputDecoration(
                              hintText: "Email",
                              helperText: "Enter email e.g XX@gmail.com",
                              prefixIcon: Icon(Icons.alternate_email),
                              // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter email address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: passwordController,
                            focusNode: passwordFocusNode,
                            obscureText: true,
                            onFieldSubmitted: (Value) {},
                            decoration: const InputDecoration(
                              hintText: "Password",
                              helperText:
                                  "Enter Password with minimum 5 characters",
                              prefixIcon: Icon(Icons.lock_open),
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
                      const SizedBox(height: 30),
                      // RoundButton(
                      //   loading: loading,
                      //   title: 'Continue',
                      //   ontap: () async {
                      //     if (_formkey.currentState!.validate()) {
                      //       return;
                      //     }
                      //     var email = emailController.text.trim();
                      //     var password = passwordController.text.trim();
                      //     if (email.isEmpty || password.isEmpty) {
                      //       return;
                      //     }
                      //     try {
                      //       FirebaseAuth auth = FirebaseAuth.instance;
                      //       UserCredential userCredential =
                      //           await auth.signInWithEmailAndPassword(
                      //               email: email, password: password);
                      //       if (userCredential.user != null) {
                      //         Navigator.of(context).pushReplacement(
                      //             MaterialPageRoute(builder: (context) {
                      //           return Homepage();
                      //         }));
                      //       }
                      //     } on FirebaseAuthException catch (e) {
                      //       if (e.code == 'user-not-found') {
                      //         // Fluttertoast.showToast(msg: 'User not found');
                      //       } else if (e.code == 'wrong-password') {
                      //         // ScaffoldMessenger.of(context).showSnackBar(
                      //         //   Snackbar(
                      //         //   )
                      //         //
                      //         // )
                      //         // Fluttertoast.showToast(msg: 'Wrong password');
                      //       }
                      //     } catch (e) {
                      //       // Fluttertoast.showToast(msg: 'Something went wrong');
                      //     }
                      //   },
                      // ),
                      RoundButton(
                        loading: loading,
                        title: 'Continue',
                        ontap: () async {
                          var email = emailController.text.trim();
                          var password = passwordController.text.trim();
                          if (email.isEmpty || password.isEmpty) {
                            return;
                          }

                          try {
                            FirebaseAuth auth = FirebaseAuth.instance;

                            if (loading == true) {
                              await showCircularProgress();
                              return;
                            }

                            UserCredential userCredential =
                                await auth.signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );

                            if (userCredential.user != null) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                                  return Dash_Screen(initialTabIndex: 0,);
                                }),
                              );
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              showToast('User not found');
                            } else if (e.code == 'wrong-password') {
                              showToast('Wrong password');
                            }
                          } catch (e) {
                            showToast('Something went wrong');
                          }
                        },
                      ),

                      const SizedBox(height: 50),
                      // Divider(
                      //   color: Colors.green,
                      //   height: 5,
                      //   thickness: 1,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16)),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupScreen()));
                              },
                              child: Text("Sign Up",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 16)))
                        ],
                      ),
                      // SizedBox(height: 200,),

                      // SizedBox(height: 35),
                      // SignInButton(
                      //   Buttons.Google,
                      //   onPressed: () {},
                      // ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // SignInButton(
                      //   Buttons.Apple,
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                )),
          ),
        ));
  }
}
