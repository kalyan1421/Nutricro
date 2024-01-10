import 'package:diettest2/pages/Profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/round_button.dart';
import '../utils/utils.dart';

class Verify_code extends StatefulWidget {
  const Verify_code({Key? key , required this.verificationId}) : super(key: key);
  final String verificationId ;

  @override
  State<Verify_code> createState() => _LoginwithPhonenumberState();
}
class _LoginwithPhonenumberState extends State<Verify_code> {
  bool loading = false;
  final verifycodeController = TextEditingController();
  final auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20,),

            TextFormField(
              controller: verifycodeController,
              // keyboardType: TextInputType.,
              decoration: const InputDecoration(
                  hintText: ' digit code'
              ),
            ),
            const SizedBox(height: 80),
            RoundButton(title: 'Verify One Time Password',
                loading: loading,
                ontap: () async {
              setState(() {
                loading =true;
              });
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: verifycodeController.text.toString()
                  );
                  try {
                    await auth.signInWithCredential(credential);
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Profile_page()));
                  } catch (e) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage(e.toString());
                  }
                }),
          ],
        ),
      ),

    );
  }
}