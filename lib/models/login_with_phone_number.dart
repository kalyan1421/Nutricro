import 'package:diettest2/models/Verif_code.dart';
import 'package:diettest2/screens/round_button.dart';
import 'package:diettest2/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginwithPhonenumber extends StatefulWidget {
  const LoginwithPhonenumber({Key? key}) : super(key: key);

  // const ({Key? key}) : super(key: key);

  @override
  State<LoginwithPhonenumber> createState() => _LoginwithPhonenumberState();
}
class _LoginwithPhonenumberState extends State<LoginwithPhonenumber> {

  bool loading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
          const SizedBox(height: 20,),

          TextFormField(
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: '+91 123456789'
            ),
          ),
            const SizedBox(height: 80),
            RoundButton(title: 'Get One Time Password', loading: loading, ontap: (){

              setState(() {
                loading = true;
              });
              auth.verifyPhoneNumber(
                  phoneNumber: phoneNumberController.text,
                  verificationCompleted: (_){
                    setState(() {
                      loading = false;
                    });
                  },
                  verificationFailed: (e){
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage(e.toString());
                  },
                  codeSent: (String verificationId , int? token){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Verify_code(verificationId: verificationId)));
                    setState(() {
                      loading = false;
                    });
                  },
                  codeAutoRetrievalTimeout: (e){
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage(e.toString());
                  });
              
            })
        ],
      ),
      ),
    );
  }
}
