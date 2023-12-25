class PlacesModel {
  List<Place> data;

  PlacesModel({required this.data});

  factory PlacesModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<Place> placesList = dataList.map((placeJson) => Place.fromJson(placeJson)).toList();

    return PlacesModel(data: placesList);
  }
}

class Place {
  int id;
  String name;
  String type;
  String data;
  String evaluation;
  String contact;
  String timeVisit;
  String images;

  Place({
    required this.id,
    required this.name,
    required this.type,
    required this.data,
    required this.evaluation,
    required this.contact,
    required this.timeVisit,
    required this.images,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      data: json['data'] as String,
      evaluation: json['evaluation'] as String,
      contact: json['contact'] as String,
      timeVisit: json['timeVisit'] as String,
      images: json['images'] as String,
    );
  }
}
