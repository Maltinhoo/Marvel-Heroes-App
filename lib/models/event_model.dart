import 'item_model.dart';

class EventModel {
  int? available;
  String? collectionURI;
  List<ItemModel>? items;
  int? returned;

  EventModel({this.available, this.collectionURI, this.items, this.returned});

  EventModel.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    items = (json['items'] as List).map((i) => ItemModel.fromJson(i)).toList();
    returned = json['returned'];
  }
}
