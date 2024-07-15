// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dairy/DataBase/DB%20List.dart';
import 'package:dairy/DataBase/DataBase.dart';
import 'package:dairy/Widgets/Calender.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DairyHome extends StatefulWidget {
  const DairyHome({super.key});

  @override
  State<DairyHome> createState() => _DairyHomeState();
}

class _DairyHomeState extends State<DairyHome> {
  @override
  void initState() {
    loadUi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My dairy"),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black45,
              size: 35,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: PopupMenuButton(
              child: Icon(
                Icons.menu,
                size: 35,
                color: Colors.black45,
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      child: Row(
                    children: [Icon(Icons.save), Text("data")],
                  ))
                ];
              },
            ),
          )
        ],
      ),
      body: dayBydayDairy.isEmpty
          ? Center(child: Text("Empty !!"))
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 70, bottom: 50),
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
                              front: Card(
                                  color: Colors.cyan,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 15,
                                        child: Text(
                                          "10",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 60),
                                        ),
                                      ),
                                      Positioned(
                                        top: 55,
                                        left: 10,
                                        child: Text(
                                          "Jan",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 60),
                                        ),
                                      ),
                                      Positioned(
                                        top: 135,
                                        left: 15,
                                        child: Text(
                                          dayBydayDairy[index]['dtitle'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 45),
                                        ),
                                      ),
                                      Positioned(
                                        top: 195,
                                        left: 15,
                                        child: Container(
                                          width: 277,
                                          child: ReadMoreText(
                                            textAlign: TextAlign.left,
                                            trimMode: TrimMode.Line,
                                            trimLines: 2,
                                            dayBydayDairy[index]['dcontent'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 10,
                                          right: 5,
                                          child: IconButton(
                                              onPressed: () {
                                                deleteDairy(null);
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: 35,
                                              ))),
                                      Positioned(
                                          bottom: 10,
                                          left: 15,
                                          right: 50,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                ContentPage(
                                                    dayBydayDairy[index]['id']);
                                              },
                                              child: Text("View"))),
                                    ],
                                  )),
                              back: Calender()))
                    ],
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ContentPage(null),
        backgroundColor: Colors.grey[400],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  final titleController = TextEditingController();
  final contentController = TextEditingController();
  void ContentPage(int? id) async {
    if (id != null) {
      final existingDairy =
          dayBydayDairy.firstWhere((element) => element['id'] == id);
      titleController.text = existingDairy['dtitle'];
      contentController.text = existingDairy['dcontent'];
    }
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          child: SizedBox(
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
                        padding: EdgeInsets.only(top: 100),
                        //Title
                        child: TextField(
                          controller: titleController,
                          style: TextStyle(fontSize: 45),
                          keyboardType: TextInputType.multiline,
                          maxLines: 1,
                          decoration: InputDecoration(
                              hintText: "Title",
                              hintStyle: TextStyle(color: Colors.white60),
                              border: InputBorder.none),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 350, top: 120),
                        //Date
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
                      height: 700,
                      color: Colors.white54,
                      padding: EdgeInsets.only(left: 15, top: 5),
                      // content
                      child: TextField(
                        controller: contentController,
                        style: TextStyle(fontSize: 25),
                        keyboardType: TextInputType.multiline,
                        maxLines: 2000,
                        decoration: InputDecoration(
                            hintText: "Content", border: InputBorder.none),
                      )),
                  ElevatedButton(
                      onPressed: () async {
                        if (id == null) {
                          await createDairy();
                        }
                        if (id != null) {
                          await updateDairy(id);
                        }
                        titleController.text = '';
                        contentController.text = '';
                        Navigator.pop(context);
                      },
                      child: Text(id == null ? "create" : "Update"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> createDairy() async {
    var id =
        await SQLdb.create_dairy(titleController.text, contentController.text);
    print(id);
    loadUi();
  }

  Future<void> updateDairy(int id) async {
    await SQLdb.update_dairy(id, titleController.text, contentController.text);
    loadUi();
  }

  void loadUi() async {
    final data = await SQLdb.load_dairy();
    setState(() {
      dayBydayDairy = data;
    });
  }

  void deleteDairy(param0) {}
}
