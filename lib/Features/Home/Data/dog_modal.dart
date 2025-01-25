class DogListModal {
  String? id;
  String? name;
  String? details;
  String? url;

  DogListModal({this.id, this.name, this.details, this.url});

  DogListModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    url = json['url'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['details'] = this.details;
    data['url'] = this.url;
    return data;
  }
}
