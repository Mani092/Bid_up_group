import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Password Reset link sent! Check your email.'),
            );
          });
    } on FirebaseAuthException catch(e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("Assets/forgot_password.png").py(10),
              "We will send a password reset link on the registered email".text.lg.center.make().pOnly(left: 15,right: 15).py(8),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  // onChanged: (value){
                  //   email = value;
                  // },
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      prefixIcon: Icon(CupertinoIcons.person_crop_circle)
                  ),

                  validator: (value) {
                    if(value!.isEmpty){
                      return "Username cannot be empty";
                    }
                    return null;
                  },
                ).px(8),
              ).px(30).py(10),

              MaterialButton(onPressed: passwordReset,
                child: "Reset Password".text.make(),
                color: Colors.blue,
              ).cornerRadius(10)
            ],
          ),
        ),
      ),
    );
  }
}