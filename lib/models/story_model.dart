import 'item_model.dart';

class StoryModel {
  int? available;
  String? collectionURI;
  List<ItemModel>? items;
  int? returned;

  StoryModel({this.available, this.collectionURI, this.items, this.returned});

  StoryModel.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    items = (json['items'] as List).map((i) => ItemModel.fromJson(i)).toList();
    returned = json['returned'];
  }
}
