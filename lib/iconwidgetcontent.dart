import 'package:flutter/material.dart';
import 'constants.dart';



class IconContent extends StatelessWidget {
  IconContent({Key? key,required this.icon,required this.label}) : super(key: key);

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(height: 15.0),
        Text("$label",style: klabelstyle),
      ],
    );
  }
}