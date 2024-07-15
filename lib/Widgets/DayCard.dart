// ignore_for_file: prefer_const_constructors

import 'package:dairy/DataBase/DB%20List.dart';
import 'package:dairy/Widgets/Calender.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';


class DayCard extends StatelessWidget{
  const DayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder( scrollDirection: Axis.horizontal, 
          padding: EdgeInsets.only(left: 15, right: 15, top: 70, bottom: 50),
          itemCount: dayBydayDairy.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 500,
                  width: 300,
                  child: FlipCard(
                    flipOnTouch: true,
                    front:   
                     Card( 
                      color: Colors.cyan,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 15,
                            child: Text(
                              "10",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 60),
                            ),
                          ),
                          Positioned(
                            top: 55,
                            left: 10,
                            child: Text(
                              "Jan",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 60),
                            ),
                          ),Positioned( bottom: 10, right: 5,
                              child: IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.white, size: 35,))),
                          Positioned( bottom: 10,  left:  15, right: 50,
                              child: ElevatedButton( onPressed: (){}, child: Text("View"))),
                        ],
                      )),  
                  
                  
                  
                  back: Calender())
                
                )
               
              ],
            );
          },
        ),
      );
  }
  


 }
