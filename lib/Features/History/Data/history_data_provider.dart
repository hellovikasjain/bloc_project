import 'package:hive/hive.dart';

class HistoryDataProvider{
  List<Map<String,dynamic>> list=[];

  var box = Hive.box("dogBox");






  Future< List<Map<String,dynamic>>> getHistoryData()async{


   list= await box.get("history",defaultValue: []);
   return list;



  }

}