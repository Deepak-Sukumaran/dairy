// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables



import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      
       SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // padding: EdgeInsets.only(left: 15, top: 100),
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://w0.peakpx.com/wallpaper/500/579/HD-wallpaper-anime-room-computer-night.jpg"),
                        fit: BoxFit.cover)),
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.only( top: 100),
                    child: TextField(
                      style: TextStyle(fontSize: 45),
                      keyboardType: TextInputType.multiline,
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: "Title",
                          hintStyle: TextStyle(color: Colors.white60),
                          border: InputBorder.none), 
                    ),
                  ), Padding(
                    padding: const EdgeInsets.only(left: 350, top: 120),
                    child: TextField(
                        style: TextStyle(fontSize: 25),
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        decoration: InputDecoration(
                            hintText: "Date",
                            hintStyle: TextStyle(color: Colors.white60),
                            border: InputBorder.none), 
                      ),
                  )
                ]),
              ),
              Container(
                  color: Colors.white54,
                  padding: EdgeInsets.only(left: 15, top: 5),
                  child: TextField(
                    style: TextStyle(fontSize: 25),
                    keyboardType: TextInputType.multiline,
                    maxLines: 200,
                    decoration: InputDecoration(
                        hintText: "Content", border: InputBorder.none),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
