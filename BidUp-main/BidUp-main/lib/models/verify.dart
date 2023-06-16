import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bidup/models/home.dart';
import 'package:bidup/login.dart';

class Verify extends StatelessWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          } else if(snapshot.hasData) {
            return const Home();
          }
          else if(snapshot.hasError) {
            return Center(child: "Something went wrong".text.make());
          } else{
            return const LoginPage();
          }
        },),);
  }
}
