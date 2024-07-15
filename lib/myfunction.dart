import 'package:flutter/material.dart';

import 'DataBase/DataBase.dart';

class Myfunction {
final Function() loadUiCallback;
Myfunction(this.loadUiCallback);
  // create
  Future<void> createDairy(String title, String content) async {
    var id =
        await SQLdb.create_dairy(title, content);
    print(id);
    loadUiCallback();
  }
// update
  Future<void> updateDairy(int id, String title , String content) async {
    await SQLdb.update_dairy(id, title, content);
    loadUiCallback();
  }

// delete
Future <void> deleteDairy(int id, BuildContext context ) async{
  await SQLdb.delete_dairy(id);
  loadUiCallback();
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Deleted Succesfully"),
      duration: Durations.medium1,
    ));
}

}

