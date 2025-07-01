
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../Modals/PostModal.dart';


class ServiceProvider {

  Future<List<PostModal>> getData() async {
    print("123 >>>>>>>>>>>>object");

   try{
     final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"), );
     print("123 object");
     if (response.statusCode == 200) {
       List<dynamic> jsonData = jsonDecode(response.body);


       // Map the JSON to List<PostModal>
       print(jsonData.toString());
       return jsonData.map((json) => PostModal.fromJson(json)).toList();
     } else {
       throw Exception("Failed to load data");
     }

   }
   catch(e){
     debugPrint("The error is >>>>>>>>>>>>>   ${e.toString()}");
     return [];
   }
  }
}
