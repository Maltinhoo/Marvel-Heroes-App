class ItemModel {
  String? resourceURI;
  String? name;
  String? type;

  ItemModel({this.resourceURI, this.name, this.type});

  ItemModel.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
    type = json['type'];
  }
}
