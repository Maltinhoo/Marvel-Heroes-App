import 'item_model.dart';

class ComicModel {
  int? available;
  String? collectionURI;
  List<ItemModel>? items;
  int? returned;

  ComicModel({this.available, this.collectionURI, this.items, this.returned});

  ComicModel.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    items = (json['items'] as List).map((i) => ItemModel.fromJson(i)).toList();
    returned = json['returned'];
  }
}
