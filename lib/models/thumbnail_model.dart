class ThumbnailModel {
  String? path;

  String? extension;

  ThumbnailModel({
    this.path,
    this.extension,
  });

  ThumbnailModel.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }
}
