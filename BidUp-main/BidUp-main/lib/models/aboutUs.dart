import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  _launchurl() async{
  const url="https://www.youtube.com/@iiitvarcadia5334";
  launch(url);
  }
  _launchurl1() async{
  const url="https://www.instagram.com/sportscommittee.iiitv/?hl=en";
  launch(url);
  }
  _launchurl2() async{
  const url="https://twitter.com/iiitvadodarasm";
  launch(url);
  }
  _launchurl3() async{
  const url="https://www.facebook.com/iiitv/";
  launch(url);
  }
  _launchurl4() async{
  const url="https://www.instagram.com/arcadia_iiitv/?hl=en";
  launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: "About Us".text.make(),),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: const Icon(MdiIcons.youtube),
                    color: Colors.blueAccent,
                    onPressed: () {_launchurl();}),
                const SizedBox(
                  width: 10.0,
                ),
                IconButton(
                    icon: const Icon(MdiIcons.cricket),
                    color: Colors.blueAccent,
                    onPressed: () {_launchurl1();}),
                const SizedBox(
                  width: 10.0,
                ),
                IconButton(
                    icon: const Icon(MdiIcons.twitter),
                    color: Colors.blueAccent,
                    onPressed: () {_launchurl2();}),
                const SizedBox(
                  width: 10.0,
                ),
                IconButton(
                    icon: const Icon(MdiIcons.facebook),
                    color: Colors.blueAccent,
                    onPressed: () {_launchurl3();}),
                const SizedBox(
                  width: 10.0,
                ),
                IconButton(
                    icon: const Icon(MdiIcons.instagram),
                    color: Colors.blueAccent,
                    onPressed: () {_launchurl4();}),
              ],
            ),
            const SizedBox(height: 30,),
            Container(child: "Code of duty brings to you BidUp! "
                "an app that solves the many problems one has when hosting an offline auction.\n"
                "Gone is the chaotic shouting, the chatter, the maintainence, "
                "with this app you can host auctions in real time from many different locations.\n"
                "Just build a user profile and you can witness these auctions or "
                "if you are a player then you can select which sports you would like to be a part of and if you are the owner, "
                "the list of all the players is at your fingertips.\n"
                "With us, you can witness the seamless experience of an auction from anywhere "
                "without any worries.".text.xl.make()).p32(),
          ],
        ),
      ),
    );
  }
}
