import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:velocity_x/velocity_x.dart';

class MyOtp extends StatefulWidget {
  final verificationId;
  const MyOtp({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  var code='';

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    // var code = "";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
           Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('Assets/otp.png').h(200).p(10),
                "Phone Verification".text.xl4.bold.make().py(10),
                "We've sent an OTP on the provided contact no.\nEnter the OTP to verify your number.".text.xl.center.make().py(10),
              Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value) {
                  code = value;
                },
              ).py(15).px(12),
                ElevatedButton(onPressed: () async{
                  // try{
                  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  //       verificationId: MyPhone.verify,
                  //       smsCode: code);
                  //   await auth.signInWithCredential(credential);
                  //   Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
                  // }
                  // catch(e){
                  //   print("Invalid OTP");
                  // }

                  final credential = PhoneAuthProvider.credential(verificationId:widget.verificationId , smsCode: code);
                  try{
                    await auth.signInWithCredential(credential);
                    Navigator.pushNamedAndRemoveUntil(context, '/home', (route)=> false);
                  }catch(e){
                    print("Invalid OTP");
                  }

                },
                  child: "Verify phone number".text.xl.make(),
                  style: ElevatedButton.styleFrom(primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                ).w64(context).h(45)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
