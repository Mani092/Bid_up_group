import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalList_details extends StatefulWidget {
  const VerticalList_details({Key? key,required this.title,required this.img}) : super(key: key);

  final String title,img;

  @override
  State<VerticalList_details> createState() => _VerticalList_detailsState();
}

class _VerticalList_detailsState extends State<VerticalList_details> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 370,
        width: 370,
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

              ],
            ),
          ),
        ),

      ),
    );
  }
}