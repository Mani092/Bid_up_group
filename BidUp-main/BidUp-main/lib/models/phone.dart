import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'otp.dart';
import 'package:velocity_x/velocity_x.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countrycode = TextEditingController();
  final auth = FirebaseAuth.instance;



  var phone = "";
  // var countrycode = "+91";

  @override
  void initState() {
    // TODO: implement initState
    countrycode.text='+91';
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('Assets/otp.png').h(200).p(10),
                "Phone Verification".text.xl4.bold.make().py(10),
                "LogIn to the account via OTP.".text.xl.center.make().py(10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: "+91".text.xl.make().px(4),
                      ).px(10),
                      const SizedBox(
                        width: 10,
                      ),
                      "|".text.xl5.make(),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          onChanged: (value){
                            phone = value;
                          },
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                              hintText: "Enter Phone number"
                            )
                        ).px(10),
                      )
                    ],
                  ),
                ).py(15).px(10),
                ElevatedButton(onPressed: () async{
                  // await FirebaseAuth.instance.verifyPhoneNumber(
                  //   phoneNumber: '${countrycode + phone}',
                  //   verificationCompleted: (PhoneAuthCredential credential) {},
                  //   verificationFailed: (FirebaseAuthException e) {},
                  //   codeSent: (String verificationId, int? resendToken) {
                  //     MyPhone.verify = verificationId;
                  //     Navigator.pushNamed(context, "otp");
                  //   },
                  //   codeAutoRetrievalTimeout: (String verificationId) {},
                  // );

                  auth.verifyPhoneNumber(
                      phoneNumber: '${countrycode.text + phone}',
                      verificationCompleted: (_){

                  }, verificationFailed: (e){

                  }, codeSent: (String VerificationId, int? token){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOtp(verificationId: VerificationId)));
                  }, codeAutoRetrievalTimeout: (e){

                  });

                },
                  style: ElevatedButton.styleFrom(primary: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                  ),
                  child: "Send the code".text.xl.make(),
                ).w48(context).h(45)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
