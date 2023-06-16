import 'dart:convert';
import 'package:bidup/models/google.dart';
import 'package:bidup/models/list_of_players.dart';
import 'package:bidup/models/vertical.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 100),
            builder: (context, value, child) {
              return ShaderMask(
                  shaderCallback: (rect) {
                    return const RadialGradient(
                            radius: 10,
                            colors: [
                              Colors.white,
                              Colors.white,
                              Colors.transparent,
                              Colors.transparent
                            ],
                            stops: [0.0, 0.55, 0.6, 1.0],
                            center: FractionalOffset(0.95, 0.95))
                        .createShader(rect);
                  },
                  child: const PageContent());
            });
      },
    ));
  }
}

class PageContent extends StatefulWidget {
  const PageContent({Key? key}) : super(key: key);

  @override
  State<PageContent> createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  final navigator = GlobalKey<NavigatorState>();

  final data = [
    {
      "banner": "apex_banner",
      "title": "Apex legends",
      "message": "Welcome to live auction"
    },
    {
      "banner": "cricket",
      "title": "cricket",
      "message": "Welcome to live auction"
    },
    {"banner": "csgo", "title": "CS:GO", "message": "Welcome to live auction"},
    {
      "banner": "valo",
      "title": "VALORANT",
      "message": "Welcome to live auction"
    },
    {
      "banner": "pubg_banner",
      "title": "PUBG",
      "message": "Welcome to live auction"
    }
  ];

  void getData(index) async {
    String response = await rootBundle.loadString('Assets/files/players.json');
    var players = await jsonDecode(response);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListOfPlayers(
              title: data[index]["title"]?.toString() ?? '',
              img: 'Assets/images/${data[index]["banner"]}.jpg',
              players: players["players"]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BidUp!'),
        actions: [
          PopupMenuButton(
              icon: const CircleAvatar(
                radius: 12  ,
                backgroundImage: AssetImage('Assets/images/profile.png'),
                backgroundColor: Colors.transparent,
              ).pOnly(right: 8),
              position: PopupMenuPosition.under,
              elevation: 0,
              offset: const Offset(0, 0),
              onSelected: (int index){
                if (index == 1) {
                  navigator.currentState?.pushNamed('/account');
                  Navigator.pushNamed(context, '/account');
                } else if (index == 2) {
                  navigator.currentState?.pushNamed('/myTeam');
                  Navigator.pushNamed(context, '/myTeam');
                } else if (index == 3) {
                  navigator.currentState?.pushNamed('/ruleBook');
                  Navigator.pushNamed(context, '/ruleBook');
                } else if (index == 4) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 'There are no live events currently active'.text.make()));
                } else if (index == 5) {
                  navigator.currentState?.pushNamed('/aboutUs');
                  Navigator.pushNamed(context, '/aboutUs');
                } else if (index == 6) {
                    final provider = Provider.of<google>(context, listen: false);
                    provider.logout();
                    Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
                }
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Account'),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text('Team Profile'),
                    ),
                    const PopupMenuItem(
                      value: 3,
                      child: Text('RuleBook'),
                    ),
                const PopupMenuItem(
                  value: 4,
                  child: Text('Live Bidding'),
                ),
                const PopupMenuItem(
                  value: 5,
                  child: Text('About Us'),
                ),
                const PopupMenuItem(
                  value: 6,
                  child: Text('Logout'),
                ),
                  ]
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    // const Image(image: AssetImage('Assets/images/stadia_mono.png'), fit: BoxFit.fitHeight),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //   child: Column(
                    //     children: <Widget>[
                    //       const Padding(
                    //         padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                    //       ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () => getData(index),
                                      child: VerticalList(
                                        img: 'Assets/images/${data[index]["banner"]}.jpg',
                                        title: data[index]["title"]?.toString() ?? '',
                                        message: data[index]["message"]?.toString() ?? '',
                                      ),
                                    ),
                                  );
                                }
                              ),
                            ),
                          )
                        // ],
                      // ),
                    // )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
