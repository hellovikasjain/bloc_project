import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class DetailsDataProvider{
  List<Map<String,dynamic>> list=[];

  var box = Hive.box("dogBox");

  Future<List<Map<String, dynamic>>> getData() async {
    List<dynamic> response = box.get("dogList", defaultValue: []);
    return response.map((e) => Map<String, dynamic>.from(e)).toList();
  }


  Future<void> setData(data) async {
      await box.put("dogList", data);

  }

  Future<void> setHistoryData(Map<String,dynamic> data)async{

    try{
      list = await box.get("history",defaultValue: []);
    }
    catch(e){
      debugPrint("list not fount");
    }

    list.add(data);
    await box.put("history", list);



  }

}