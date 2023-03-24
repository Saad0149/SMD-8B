import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class story extends StatelessWidget {
  const story({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              
              children: List.generate(10, (index){
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  width: 67,
                  height: 67,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin:Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF9B2282),Color(0xFFEEA863)])),
                      child:Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey)],
                        shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage("assets/images/openai_logo.jpg"))
                            ),
                        
                          ),
                        ),
                      ),
                  
                  ),
              ); },),),
          ),
        ),
     
      ],
    );
  }
}