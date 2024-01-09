import 'package:austudy_01/features/app/splash_screen/splash_screen.dart';
import 'package:austudy_01/user_auth/presentation/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options: const FirebaseOptions(apiKey: "AIzaSyAV4EFsqTwTp6tF4wYa7KYwLaarshJOKjo",
            appId: "1:620028528478:web:48c07d2e501d0423e3f1cf",
            messagingSenderId: "620028528478",
            projectId: "austudy-29c95"));
    
  }else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: Colors.white12, // Set the background color to black
        ),
        useMaterial3: true,
      ),
      home: SplashScreen(
        child: LoginPage(),
      ),
    );
  }
}
