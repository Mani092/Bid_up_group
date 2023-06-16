import 'package:bidup/models/ForgotPassword.dart';
import 'package:bidup/models/home.dart';
import 'package:bidup/models/google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String pass = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // await Navigator.pushNamedAndRemoveUntil(context, "/Home", ModalRoute.withName('/home'),
      //     arguments: <String, String>{'Name': name});
      // await Navigator.popAndPushNamed(context, "/home");
      Navigator.popUntil(context, (route) => false);
      Navigator.pushNamed(context, '/home');
      setState(() {
        changeButton = false;
      });
    }
  }

  bool check = false;
  void Toggle() {
    if (check == false)
      check = true;
    else
      check = false;
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Invalid email or password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("Enter a valid email and password"),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: 'Close'.text.teal400.make(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Image.asset("Assets/Welcome.png", fit: BoxFit.fill),
            const SizedBox(height: 20.0),
            const SizedBox(height: 20.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(CupertinoIcons.mail_solid),
                          hintText: "Enter your Email",
                          labelText: "Email",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        obscureText: !check,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: const Icon(CupertinoIcons.lock_shield),
                          hintText: "Enter Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                Toggle();
                                setState(() {});
                              },
                              icon: !check
                                  ? const Icon(CupertinoIcons.eye_slash)
                                  : const Icon(CupertinoIcons.eye)),
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 8) {
                            return "Length of the password cannot be less than 8";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          pass = value;
                          setState(() {});
                        },
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPasswordPage()));
                        },
                        child: const Text(
                          "                                           "
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                        onPressed: () {
                          FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: email,
                              password: pass
                          ).then((value){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          }).onError((error, stackTrace){
                            showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              _buildPopupDialog(context),
                                        );
                            print("Wrong credentials.");
                          });
                        },
                        child: "Login".text.make()
                    ).h(40).w40(context),

                    // InkWell(
                    //   onTap: () => {
                    //     if (pass.toString() == "rsvp691@")
                    //       {moveToHome(context)}
                    //     else
                    //       {
                    //         showDialog(
                    //           context: context,
                    //           builder: (BuildContext context) =>
                    //               _buildPopupDialog(context),
                    //         )
                    //       }
                    //   },
                    //   child: AnimatedContainer(
                    //     duration: const Duration(seconds: 1),
                    //     width: changeButton ? 50 : 150,
                    //     height: 50,
                    //     alignment: Alignment.center,
                    //     decoration: BoxDecoration(
                    //       color: Colors.black,
                    //       borderRadius:
                    //           BorderRadius.circular(changeButton ? 50 : 10),
                    //     ),
                    //     child: changeButton
                    //         ? const Icon(
                    //             Icons.done,
                    //             color: Colors.white,
                    //           )
                    //         : const Text('Login',
                    //             style: TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 20,
                    //               color: Colors.white,
                    //             )),
                    //   ),
                    // ),
                    Row(
                      children: [
                        const Text("Don't have an account?",
                            style: TextStyle(
                              fontSize: 14,
                            )),
                        TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/SignUp'),
                            child: const Text(
                              "SignUp",
                              style: TextStyle(
                                  fontSize: 14,),
                            )),
                      ],
                    ).px(36),
                    Row(
                      children: const [
                        Expanded(child: Divider(thickness: 3, indent: 20, endIndent: 10, height: 30,)),
                        Text('or'),
                        Expanded(child: Divider(thickness: 3, indent: 10, endIndent: 20, height: 30,)),
                      ],
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(FontAwesomeIcons.google),
                      onPressed: () {
                        final provider =
                            Provider.of<google>(context, listen: false);
                        try {
                          provider.googleLogin();
                          Navigator.popUntil(context, (route) => false);
                          // Navigator.pushNamed(context, '/home');
                        } catch (e) {
                          print("Wrong credentials");
                        }
                        Navigator.pushNamed(context, "/verify");
                      },
                      label: "SignIn with Google".text.make(),
                    ),
                    Row(
                      children: const [
                        Expanded(child: Divider(thickness: 3, indent: 20, endIndent: 10, height: 30,)),
                        Text('or'),
                        Expanded(child: Divider(thickness: 3, indent: 10, endIndent: 20, height: 30,)),
                      ],
                    ),
                    ElevatedButton(onPressed: ()=> Navigator.pushNamed(context, "/otp"), child: "Login via OTP".text.make()),
                    "(For viewers only)".text.make()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
