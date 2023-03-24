import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';


class postwidget extends StatelessWidget {
  const postwidget
({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context,index){
      return Column(
        children: [
          ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(),
                image: DecorationImage(image: AssetImage("assets/images/openai_logo.jpg"))
              ),
            ),
            title: Text("OpenAi"),
            subtitle: Text("karachi Pakistan"),
            trailing: Icon(Icons.more_vert),
          )
        ,Container(
          height: 300,
          decoration: BoxDecoration(
            
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/openai_logo.jpg")),
              
          ),
        )
       ,ListTile(
        leading: Wrap(children: [
          Icon(Icons.favorite,color: Colors.red),
          Icon(Icons.message_rounded,color: Colors.grey,),
        ]
          )
          )

        ]
      );
    });
  }
}