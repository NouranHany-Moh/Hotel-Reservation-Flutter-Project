import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan,

       title: Text(
          "CastawayResort",
         style: TextStyle(
           color:Colors.white,
           fontSize: 20,
           fontFamily:'Pacifico' ,
         ),
        )
      ),
    );
  }
}
