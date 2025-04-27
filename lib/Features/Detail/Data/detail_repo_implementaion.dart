import 'package:assessment/Features/Detail/Data/details_data_provider.dart';
import 'package:assessment/Features/Detail/Domain/detail_repo_definition.dart';
import 'package:assessment/Features/Home/Data/dog_modal.dart';
import 'package:flutter/cupertino.dart';

class DetailRepoImplementation extends DetailRepoDefinition{

  @override
  Future<void> adoptDog(DogListModal modal) async {
    var response = await DetailsDataProvider().getData();
    var data= updateCanAdopt(modal.id.toString(), false, response);

    Map<String,dynamic> record = {
      "id":modal.id,
      "name":modal.name,
      "url":modal.url,
      "date":DateTime.now()
    };

    await DetailsDataProvider().setData(data);
    await DetailsDataProvider().setHistoryData(record);

  }

  List<Map<String, dynamic>> updateCanAdopt(String id, bool newValue, List<Map<String, dynamic>> data) {
    try {
      // Find the dog with the matching ID
      var dog = data.firstWhere((dog) => dog['id'] == id);
      // Update the `canAdopt` value
      dog['canAdopt'] = newValue;


    } catch (e) {
      debugPrint("Dog with id $id not found.");
    }
    return data;
  }

}