import 'package:hive/hive.dart';

class HomeDataProvider {
  List<Map<String, dynamic>> data = [
    {
      "id": "HkNkxlqEX",
      "name": "Dog HkNkxlqEX",
      "age": 2,
      "price": 500,
      "url": "https://cdn2.thedogapi.com/images/HkNkxlqEX_1280.jpg",
      "canAdopt": true
    },
    {
      "id": "HkP7Vxc4Q",
      "name": "Dog HkP7Vxc4Q",
      "age": 1,
      "price": 400,
      "url": "https://cdn2.thedogapi.com/images/HkP7Vxc4Q_1280.jpg",
      "canAdopt": true
    },
    {
      "id": "Hyv-ne94m",
      "name": "Dog Hyv-ne94m",
      "age": 3,
      "price": 700,
      "url": "https://cdn2.thedogapi.com/images/Hyv-ne94m_1280.jpg",
      "canAdopt": true
    },
    {
      "id": "chQC0QwHn",
      "name": "Dog chQC0QwHn",
      "age": 4,
      "price": 600,
      "url": "https://cdn2.thedogapi.com/images/chQC0QwHn.jpg",
      "canAdopt": true
    },
    {
      "id": "sGQvQUpsp",
      "name": "Dog sGQvQUpsp",
      "age": 1,
      "price": 300,
      "url": "https://cdn2.thedogapi.com/images/sGQvQUpsp.jpg",
      "canAdopt": true
    },
    {
      "id": "ROvy59azW",
      "name": "Dog ROvy59azW",
      "age": 2,
      "price": 550,
      "url": "https://cdn2.thedogapi.com/images/ROvy59azW.jpg",
      "canAdopt": true
    },
    {
      "id": "CVbVUx8pJ",
      "name": "Dog CVbVUx8pJ",
      "age": 3,
      "price": 750,
      "url": "https://cdn2.thedogapi.com/images/CVbVUx8pJ.jpg",
      "canAdopt": true
    },
    {
      "id": "L4ED868m_",
      "name": "Dog L4ED868m_",
      "age": 5,
      "price": 900,
      "url": "https://cdn2.thedogapi.com/images/L4ED868m_.jpg",
      "canAdopt": true
    },
    {
      "id": "tFQkJi_-6",
      "name": "Dog tFQkJi_-6",
      "age": 2,
      "price": 400,
      "url": "https://cdn2.thedogapi.com/images/tFQkJi_-6.jpg",
      "canAdopt": true
    },
    {
      "id": "72Ttvx0Iz",
      "name": "Dog 72Ttvx0Iz",
      "age": 1,
      "price": 350,
      "url": "https://cdn2.thedogapi.com/images/72Ttvx0Iz.jpg",
      "canAdopt": true
    },
    {
      "id": "HkRcZe547",
      "name": "Dog HkRcZe547",
      "age": 3,
      "price": 650,
      "url": "https://cdn2.thedogapi.com/images/HkRcZe547_1280.jpg",
      "canAdopt": true
    },
    {
      "id": "SJqBMg5Nm",
      "name": "Dog SJqBMg5Nm",
      "age": 4,
      "price": 700,
      "url": "https://cdn2.thedogapi.com/images/SJqBMg5Nm_1280.jpg",
      "canAdopt": true
    },
    {
      "id": "S1RGml5Em",
      "name": "Dog S1RGml5Em",
      "age": 2,
      "price": 450,
      "url": "https://cdn2.thedogapi.com/images/S1RGml5Em_1280.jpg",
      "canAdopt": true
    },
    {
      "id": "r1xXEgcNX",
      "name": "Dog r1xXEgcNX",
      "age": 3,
      "price": 500,
      "url": "https://cdn2.thedogapi.com/images/r1xXEgcNX_1280.jpg",
      "canAdopt": true
    },
    {
      "id": "rJa29l9E7",
      "name": "Dog rJa29l9E7",
      "age": 1,
      "price": 300,
      "url": "https://cdn2.thedogapi.com/images/rJa29l9E7_1280.jpg",
      "canAdopt": true
    },
    {
      "id": "A09F4c1qP",
      "name": "Dog A09F4c1qP",
      "age": 5,
      "price": 1000,
      "url": "https://cdn2.thedogapi.com/images/A09F4c1qP.jpg",
      "canAdopt": true
    },
    {
      "id": "9LkzqFTjO",
      "name": "Dog 9LkzqFTjO",
      "age": 2,
      "price": 400,
      "url": "https://cdn2.thedogapi.com/images/9LkzqFTjO.jpg",
      "canAdopt": true
    },
    {
      "id": "NCA5enafW",
      "name": "Dog NCA5enafW",
      "age": 3,
      "price": 550,
      "url": "https://cdn2.thedogapi.com/images/NCA5enafW.jpg",
      "canAdopt": true
    },
    {
      "id": "DbcfkQrav",
      "name": "Dog DbcfkQrav",
      "age": 1,
      "price": 300,
      "url": "https://cdn2.thedogapi.com/images/DbcfkQrav.jpg",
      "canAdopt": true
    },
    {
      "id": "fjFIuehNo",
      "name": "Dog fjFIuehNo",
      "age": 4,
      "price": 700,
      "url": "https://cdn2.thedogapi.com/images/fjFIuehNo.jpg",
      "canAdopt": true
    }
  ]
  ;

  var box = Hive.box("dogBox");

  HomeDataProvider() {
    _initBox();
  }

  Future<void> _initBox() async {

    await _setData();
  }

  Future<void> _setData() async {
    if (box.get("dogList") == null) {
      await box.put("dogList", data);
    }
  }


  /// Get data from the box
  Future<List<Map<String, dynamic>>> getData() async {
    await _initBox(); // Ensure the box is initialized before accessing it.

    List<dynamic> response = box.get("dogList", defaultValue: []);
    return response.map((e) => Map<String, dynamic>.from(e)).toList();
  }

}
