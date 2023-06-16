import 'package:flutter/material.dart';
import 'package:bidup/models/player_data.dart';
import 'package:velocity_x/velocity_x.dart';

class ListOfPlayers extends StatefulWidget
{
  final String title,img;
  final List players;

  const ListOfPlayers({Key? key,required this.title,required this.img, required this.players}) : super(key: key);

  @override
  State<ListOfPlayers> createState() => _ListOfPlayersState();
}

class _ListOfPlayersState extends State<ListOfPlayers>
{
  @override
  Widget build(BuildContext context)
  {
    // return Scaffold
    //   (
    //   body: VerticalList_details(title: widget.title,img:widget.img,)
    // );
    return Scaffold
      (
      appBar: AppBar
        (
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: context.screenWidth,
                child: Image(image: AssetImage(widget.img))
            ),
            Expanded
              (
              child: ListView.builder
                (
                shrinkWrap: true,
                itemCount: widget.players.length,
                itemBuilder: (context, index)
                {
                  return Card
                    (
                    child: Padding
                      (
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                      child: ListTile
                        (
                        onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context) => PlayerData(player: widget.players[index]),)),
                        title: Text(widget.players[index]['name']),
                        subtitle: Text("Rank: ${widget.players[index]['rank']},\nStarting bid: ${widget.players[index]['starting bid']}"),
                        leading: CircleAvatar
                          (
                          // radius: 30,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(widget.players[index]["image url"]),
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}