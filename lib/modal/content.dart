class Content {
  Content({
    required this.url,
    required this.name,

  });
  late final String url;
  late final String name;
  Content.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
  }


  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['name'] = name;
    return _data;
  }
}

