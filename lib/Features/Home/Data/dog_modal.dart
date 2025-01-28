class DogListModal {
  String? id;
  String? name;
  int? age;
  int? price;
  String? url;
  bool? canAdopt;

  DogListModal(
      {this.id, this.name, this.age, this.price, this.url, this.canAdopt});

  DogListModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    price = json['price'];
    url = json['url'];
    canAdopt = json['canAdopt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['price'] = this.price;
    data['url'] = this.url;
    data['canAdopt'] = this.canAdopt;
    return data;
  }
}
