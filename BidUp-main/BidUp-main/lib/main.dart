import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'models/myTeam.dart';
import 'models/account.dart';
import 'models/bid.dart';
import 'models/google.dart';
import 'models/verify.dart';
import 'models/phone.dart';
import 'models/rulebook.dart';
import 'models/home.dart';
import 'Signup.dart';
import 'models/aboutUs.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    // const firebaseOptions = FirebaseOptions(
    //   appId: '1:752706188211:android:3bc906dc61257be3a2d1c6',
    //   apiKey: 'AIzaSyCCz6s0Rh3f1H1ehZ5ynWvHY7VCkOzmigs',
    //   projectId: 'bidup-firebase',
    //   messagingSenderId: String.fromEnvironment('FIREBASE_SENDER_ID'),
    //   authDomain: 'bidup-firebase.firebaseapp.com',
    // );
    await Firebase.initializeApp(
       //options: firebaseOptions,
    );
  runApp(VxState(
      store: MyStore(),
      child: ChangeNotifierProvider(create: (context) => google(), child: const MyApp())));
}

class MyStore extends VxStore{}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.lato().fontFamily,
          cardColor: Colors.white,
          canvasColor: Colors.grey[100],
          accentColor: Colors.black,
          drawerTheme: DrawerThemeData(
            backgroundColor: Colors.tealAccent[100],
          ),
          appBarTheme: AppBarTheme(
            color: Colors.grey[100],
            elevation: 0.0,
            toolbarTextStyle: context.textTheme.bodyText2,
            titleTextStyle: context.textTheme.headline6,
          ),
        ),
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.lightBlue,
          cardColor: Colors.grey[900],
          canvasColor: Colors.grey[800],
          accentColor: Colors.white,
          drawerTheme: DrawerThemeData(
            backgroundColor: Colors.grey[800],
          ),
          appBarTheme: AppBarTheme(color: Colors.grey[800], elevation: 0),
        ),
        initialRoute: "/login",
        routes: {
          "/": (context)=> const Home(),
          "/SignUp": (context)=> const SignUpPage(),
          "/login": (context)=> const LoginPage(),
          "/home": (context)=> const Home(),
          "/otp": (context)=> const MyPhone(),
          "/myTeam": (context)=> const myTeam(),
          "/account": (context)=> const Accounts(),
          "/live": (context)=> const liveBidding(),
          "/ruleBook": (context)=> const rulebook(),
          "/verify": (context)=> const Verify(),
          "/aboutUs": (context)=> const AboutUs(),
        },
      );
  }
}
