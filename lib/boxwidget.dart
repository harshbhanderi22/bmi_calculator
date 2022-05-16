import 'package:flutter/material.dart';


class singlebox extends StatelessWidget {
  singlebox({required this.boxcolor,required this.boxchild});
  final Color boxcolor;
  final Widget boxchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: boxchild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: boxcolor,
          borderRadius: BorderRadius.circular(20.0)
      ),
    );
  }


}
