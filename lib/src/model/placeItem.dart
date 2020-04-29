class PlaeceItem {
  String name;
  String address;
  double lat;
  double lng;

  PlaeceItem(this.name, this.address, this.lat, this.lng);

  static List<PlaeceItem> fromJson(Map<String, dynamic> json) {
    List<PlaeceItem> rs = new List();
    var results = json['results'] as List;
    for (var item in results) {
      var p = new PlaeceItem(
          item['name'],
          item['formatted_address'],
          item['geometry']['location']['lat'],
          item['geometry']['location']['lng']);
      rs.add(p);
    }
    return rs;
  }
}
