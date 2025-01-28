import 'package:hive/hive.dart';

class DetailsDataProvider{

  var box = Hive.box("dogBox");

  Future<List<Map<String, dynamic>>> getData() async {
    List<dynamic> response = box.get("dogList", defaultValue: []);
    return response.map((e) => Map<String, dynamic>.from(e)).toList();
  }


  Future<void> setData(data) async {
      await box.put("dogList", data);

  }


}