import 'package:diettest2/Dashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:diettest2/auth_controllers/UI/loginscreen.dart';
import 'package:diettest2/splashscreens/splash_screen.dart';

Future main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Text(
      "Error Please Restart App",
      style: GoogleFonts.abrilFatface(
        color: Colors.pink[200],
        fontSize: 15.0,
      ),
      textAlign: TextAlign.center,
    );
  };

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final status = await Permission.location.request();
  await Future.delayed(const Duration(seconds: 3));
  if (status.isGranted || status.isDenied) {
    runApp(const MyApp());
  } else if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        onInitializationComplete: () {
          // Once splash screen is complete, show the main app UI
          runApp(AppContent());
        },
      ),
    );
  }
}

class AppContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return Dash_Screen(initialTabIndex: 0);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.hasError}'),
            );
          }
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.black),
          );
        }
        return LoginScreen();
      },
    );
  }
}
