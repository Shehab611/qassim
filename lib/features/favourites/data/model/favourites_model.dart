class FavouritesModel {
  late List<List<AllPlace>> allPlace;

  FavouritesModel({required this.allPlace});

  factory FavouritesModel.fromJson(Map<String, dynamic> json) {
    List<List<AllPlace>> allPlaceList = [];

    if (json['allPlace'] != null) {
      json['allPlace'].forEach((v) {
        List<AllPlace> tempList = [];
        v.forEach((item) {
          tempList.add(AllPlace.fromJson(item));
        });
        allPlaceList.add(tempList);
      });
    }

    return FavouritesModel(allPlace: allPlaceList);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allPlace.isNotEmpty) {
      data['allPlace'] =
          allPlace.map((v) => v.map((item) => item.toJson()).toList()).toList();
    }
    return data;
  }
}

class AllPlace {
  int id;
  String name;
  String type;
  String data;
  String evaluation;
  String contact;
  String timeVisit;
  String images;

  AllPlace({
    required this.id,
    required this.name,
    required this.type,
    required this.data,
    required this.evaluation,
    required this.contact,
    required this.timeVisit,
    required this.images,
  });

  factory AllPlace.fromJson(Map<String, dynamic> json) {
    return AllPlace(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      data: json['data'],
      evaluation: json['evaluation'],
      contact: json['contact'],
      timeVisit: json['timeVisit'],
      images: json['images'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['data'] = data;
    data['evaluation'] = evaluation;
    data['contact'] = contact;
    data['timeVisit'] = timeVisit;
    data['images'] = images;
    return data;
  }
}
