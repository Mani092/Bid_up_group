import 'package:bidup/login.dart';
import 'package:bidup/models/google.dart';
import 'package:bidup/models/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    return Scaffold(
      // appBar: AppBar(),
      //backgroundColor: Colors.grey[300],
      body: SafeArea(
      child: SingleChildScrollView(
      child: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset("Assets/signup.png",
      fit: BoxFit.cover,
    ),
    "Sign Up".text.xl4.bold.make().py(16),
    Container(
    decoration: BoxDecoration(
    border: Border.all(width: 1, color: Colors.grey),
    borderRadius: BorderRadius.circular(10),
    ),
    child: const TextField(
    decoration: InputDecoration(
    border: InputBorder.none,
    hintText: "Name",
    icon: Icon(CupertinoIcons.person_alt)
    ),
    ).px(8),
    ).px(30).py(8),

    Container(
    decoration: BoxDecoration(
    border: Border.all(width: 1, color: Colors.grey),
    borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
    onChanged: (value){
    email = value;
    },
    decoration: const InputDecoration(
    border: InputBorder.none,
    hintText: "Email Address",
    icon: Icon(CupertinoIcons.mail_solid)
    ),
    ).px(8),
    ).px(30).py(8),

    Container(
    decoration: BoxDecoration(
    border: Border.all(width: 1, color: Colors.grey),
    borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      obscureText: true,
      onChanged: (value){
       password = value;
      },
    decoration: const InputDecoration(
    border: InputBorder.none,
    hintText: "Create Password",
    icon: Icon(CupertinoIcons.lock_shield)
    )
    ).px(8),
    ).px(30).py(8),

    ElevatedButton(
    onPressed: (){
    try {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password
    ).then((value){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    });
    // Navigator.pushNamed(context, "/home");
    } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password')
    print('The password provided is too weak.');
    else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
    showDialog(
    context: context,
    builder: (context) {
    return const AlertDialog(
    content: Text('The account already exists for that email.'),
    );
    });
    }
    } catch (e) {
    print(e);
    }
    },
    child: "Sign Up".text.make()
    ).h(40).w40(context),
        Row(
          children: const [
            Expanded(child: Divider(thickness: 3, indent: 20, endIndent: 10, height: 30,)),
            Text('or'),
            Expanded(child: Divider(thickness: 3, indent: 10, endIndent: 20, height: 30,)),
          ],
        ),
    ElevatedButton(
      onPressed: () async{
        final provider = Provider.of<google>(context, listen: false);
        try{
          await provider.googleLogin();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
        }catch(e){
          print("Invalid Credentials");
        }
      },
      child: "SignUp with Google".text.make(),
    ).h(40).w56(context),
      ],
      ),
      ),
      ),
          )
      );
    }
}