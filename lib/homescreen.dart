import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:insta/bottomwidgetbar.dart';
import 'package:insta/postWidget.dart';
import 'package:insta/story.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      
      leading: Icon(Icons.camera_alt_rounded,size: 40,color: Colors.grey[600],),
      title: Text('Instagram'),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 35,))
      ],
     ),body: Column(
       children: [
         story(),
         Divider(color: Colors.grey,),
         Expanded(child: postwidget()),]
         
     ),
     bottomNavigationBar: bottombarwidget(),
    );
  }
}