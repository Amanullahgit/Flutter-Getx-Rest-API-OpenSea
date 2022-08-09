class OpenseaModel {
  OpenseaModel({
    required this.assets,
  });

  List<Assets>? assets;

  OpenseaModel.fromJson(Map<String, dynamic> json) {
    assets = List.from(json['assets']).map((e) => Assets.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['assets'] = assets!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Assets {
  Assets({
    required this.imageUrl,
    required this.name,
    this.description,
    required this.permalink,
  });

  String? imageUrl;
  String? name;
  String? description;
  String? permalink;

  Assets.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    name = json['name'];
    description = null;
    permalink = json['permalink'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image_url'] = imageUrl;
    _data['name'] = name;
    _data['description'] = description;
    _data['permalink'] = permalink;
    return _data;
  }
}
