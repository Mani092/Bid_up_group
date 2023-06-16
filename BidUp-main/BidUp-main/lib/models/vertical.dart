import 'package:flutter/material.dart';

class VerticalList extends StatefulWidget {
  const VerticalList({Key? key,required this.img,required this.title,required this.message}) : super(key: key);

  final String img,title,message;

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
    image: DecorationImage(image: AssetImage(widget.img),
    fit: BoxFit.fill,)
    ),

    child: Container(
    child: Padding(
    padding: const EdgeInsets.only(left: 14,bottom: 14),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    Text(
    widget.title,
    style: TextStyle(color: Colors.white, fontSize: 15),
    ),
    const SizedBox(
    height: 5.0,
    ),
      Text(
        widget.message,
        style: const TextStyle(color: Colors.white, fontSize: 25.0),
      )
    ],
    ),
    ),
    ),
    );
   }
}