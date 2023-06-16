import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Accounts extends StatelessWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    ImageProvider getImage()
    {
      if (user!.photoURL.isNotEmptyAndNotNull) {
        return NetworkImage(user.photoURL!);
      } else {
        return const AssetImage('Assets/images/profile');
      }
    }

    return Scaffold(
      //backgroundColor: Colors.grey[900],
      appBar: AppBar(
        // backgroundColor: Colors.teal,
        title: const Text("User Profile"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              foregroundImage: getImage(),
            ).py(16),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16,0,32,0),
                  child: Icon(CupertinoIcons.person_alt,),
                ),
                "${user!.displayName}".text.xl.make().py(16),
              ],
            ),
            const Divider(
              thickness: 2, // thickness of the line.
              indent: 20, // empty space to the leading edge of divider.
              endIndent: 20, // empty space to the trailing edge of the divider.
              height: 20, // The divider's height extent.
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16,0,32,0),
                  child: Icon(CupertinoIcons.mail_solid,),
                ),
                "${user.email}".text.xl.make().py(16),
              ],
            ),
            const Divider(
              thickness: 2, // thickness of the line.
              indent: 20, // empty space to the leading edge of divider.
              endIndent: 20, // empty space to the trailing edge of the divider.
              height: 20, // The divider's height extent.
            ),
          ],
        ),
      ),
    );
  }
}
