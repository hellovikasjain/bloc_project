import 'package:assessment/Features/Home/Domain/repo_definition.dart';

class FetchDataImp extends FetchDogsDataRepo{
  var response = [
    {
      "id": "HkNkxlqEX",
      "name": "Dog HkNkxlqEX",
      "details": "This is a placeholder for Dog HkNkxlqEX's details.",
      "url": "https://cdn2.thedogapi.com/images/HkNkxlqEX_1280.jpg"
    },
    {
      "id": "HkP7Vxc4Q",
      "name": "Dog HkP7Vxc4Q",
      "details": "This is a placeholder for Dog HkP7Vxc4Q's details.",
      "url": "https://cdn2.thedogapi.com/images/HkP7Vxc4Q_1280.jpg"
    },
    {
      "id": "Hyv-ne94m",
      "name": "Dog Hyv-ne94m",
      "details": "This is a placeholder for Dog Hyv-ne94m's details.",
      "url": "https://cdn2.thedogapi.com/images/Hyv-ne94m_1280.jpg"
    },
    {
      "id": "chQC0QwHn",
      "name": "Dog chQC0QwHn",
      "details": "This is a placeholder for Dog chQC0QwHn's details.",
      "url": "https://cdn2.thedogapi.com/images/chQC0QwHn.jpg"
    },
    {
      "id": "sGQvQUpsp",
      "name": "Dog sGQvQUpsp",
      "details": "This is a placeholder for Dog sGQvQUpsp's details.",
      "url": "https://cdn2.thedogapi.com/images/sGQvQUpsp.jpg"
    },
    {
      "id": "ROvy59azW",
      "name": "Dog ROvy59azW",
      "details": "This is a placeholder for Dog ROvy59azW's details.",
      "url": "https://cdn2.thedogapi.com/images/ROvy59azW.jpg"
    },
    {
      "id": "CVbVUx8pJ",
      "name": "Dog CVbVUx8pJ",
      "details": "This is a placeholder for Dog CVbVUx8pJ's details.",
      "url": "https://cdn2.thedogapi.com/images/CVbVUx8pJ.jpg"
    },
    {
      "id": "L4ED868m_",
      "name": "Dog L4ED868m_",
      "details": "This is a placeholder for Dog L4ED868m_'s details.",
      "url": "https://cdn2.thedogapi.com/images/L4ED868m_.jpg"
    },
    {
      "id": "tFQkJi_-6",
      "name": "Dog tFQkJi_-6",
      "details": "This is a placeholder for Dog tFQkJi_-6's details.",
      "url": "https://cdn2.thedogapi.com/images/tFQkJi_-6.jpg"
    },
    {
      "id": "72Ttvx0Iz",
      "name": "Dog 72Ttvx0Iz",
      "details": "This is a placeholder for Dog 72Ttvx0Iz's details.",
      "url": "https://cdn2.thedogapi.com/images/72Ttvx0Iz.jpg"
    },
    {
      "id": "HkRcZe547",
      "name": "Dog HkRcZe547",
      "details": "This is a placeholder for Dog HkRcZe547's details.",
      "url": "https://cdn2.thedogapi.com/images/HkRcZe547_1280.jpg"
    },
    {
      "id": "SJqBMg5Nm",
      "name": "Dog SJqBMg5Nm",
      "details": "This is a placeholder for Dog SJqBMg5Nm's details.",
      "url": "https://cdn2.thedogapi.com/images/SJqBMg5Nm_1280.jpg"
    },
    {
      "id": "S1RGml5Em",
      "name": "Dog S1RGml5Em",
      "details": "This is a placeholder for Dog S1RGml5Em's details.",
      "url": "https://cdn2.thedogapi.com/images/S1RGml5Em_1280.jpg"
    },
    {
      "id": "r1xXEgcNX",
      "name": "Dog r1xXEgcNX",
      "details": "This is a placeholder for Dog r1xXEgcNX's details.",
      "url": "https://cdn2.thedogapi.com/images/r1xXEgcNX_1280.jpg"
    },
    {
      "id": "rJa29l9E7",
      "name": "Dog rJa29l9E7",
      "details": "This is a placeholder for Dog rJa29l9E7's details.",
      "url": "https://cdn2.thedogapi.com/images/rJa29l9E7_1280.jpg"
    },
    {
      "id": "A09F4c1qP",
      "name": "Dog A09F4c1qP",
      "details": "This is a placeholder for Dog A09F4c1qP's details.",
      "url": "https://cdn2.thedogapi.com/images/A09F4c1qP.jpg"
    },
    {
      "id": "9LkzqFTjO",
      "name": "Dog 9LkzqFTjO",
      "details": "This is a placeholder for Dog 9LkzqFTjO's details.",
      "url": "https://cdn2.thedogapi.com/images/9LkzqFTjO.jpg"
    },
    {
      "id": "NCA5enafW",
      "name": "Dog NCA5enafW",
      "details": "This is a placeholder for Dog NCA5enafW's details.",
      "url": "https://cdn2.thedogapi.com/images/NCA5enafW.jpg"
    },
    {
      "id": "DbcfkQrav",
      "name": "Dog DbcfkQrav",
      "details": "This is a placeholder for Dog DbcfkQrav's details.",
      "url": "https://cdn2.thedogapi.com/images/DbcfkQrav.jpg"
    },
    {
      "id": "fjFIuehNo",
      "name": "Dog fjFIuehNo",
      "details": "This is a placeholder for Dog fjFIuehNo's details.",
      "url": "https://cdn2.thedogapi.com/images/fjFIuehNo.jpg"
    }
  ];

  @override
   Future<List<Map<String,dynamic>>> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return response;

  }
}