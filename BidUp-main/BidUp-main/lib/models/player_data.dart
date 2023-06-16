import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class PlayerData extends StatefulWidget {
  final Map player;

  const PlayerData({Key? key, required this.player}) : super(key: key);

  @override
  State<PlayerData> createState() => _PlayerDataState();
}

class _PlayerDataState extends State<PlayerData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.transparent),
        title: const Text('Player Profile'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          buttonPadding: Vx.mOnly(right: 8),
          children: [
            const Icon(Icons.monetization_on_outlined, color: Colors.blue,),
            "Starting bid: ${widget.player['starting bid']}".text.xl.make(),
            const SizedBox(width: 60),
            ElevatedButton(onPressed: ()
            {ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 'This event is currently inactive'.text.make()));},
                child: "Place Bid".text.make())
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SingleChildScrollView(),
            Hero(
              tag: Key(widget.player['id'].toString()),
              child: Image.asset(widget.player['image url']),
            ).h32(context),
            Expanded(
                child: VxArc(
                    height: 40,
                    edge: VxEdge.TOP,
                    arcType: VxArcType.CONVEY,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          const Icon(CupertinoIcons.gamecontroller_alt_fill, size: 50),
                          "${widget.player['name']}".text.xl4.bold.make(),
                          "IGN: ${widget.player['ign']}\nRank: ${widget.player['rank']}\nGaming hours: \nWeapons: ".text.xl.make().py(16),
                          10.heightBox,
                        ],
                      ).py64(),
                    )))
          ],
        ),
      ),
    );
  }
}
