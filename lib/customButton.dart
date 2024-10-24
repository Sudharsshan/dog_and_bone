import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget{
  final function, icon;

  const Custombutton({super.key, this.function, this.icon});
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: function,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)
          ),
          child: icon,
        )
    );
  }

}