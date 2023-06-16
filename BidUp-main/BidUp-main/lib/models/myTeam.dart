import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class myTeam extends StatefulWidget {
  const myTeam({Key? key}) : super(key: key);

  @override
  State<myTeam> createState() => _myTeamState();
}

class _myTeamState extends State<myTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: "Team Profile".text.make()),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: "Start bidding in the live events to form your own team.".text.xl2.bold.make(),
        ).p16(),
      ),
    );
  }
}
