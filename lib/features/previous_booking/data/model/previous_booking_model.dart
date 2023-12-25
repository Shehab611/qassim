class PreviousBookingModel {
  List<Booking> data;

  PreviousBookingModel({required this.data});

  factory PreviousBookingModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<Booking> bookingsList = dataList.map((bookingJson) => Booking.fromJson(bookingJson)).toList();

    return PreviousBookingModel(data: bookingsList);
  }
}

class Booking {
  int id;
  String placeName;
  String type;
  String timeVisit;
  DateTime createdAt;

  Booking({
    required this.id,
    required this.placeName,
    required this.type,
    required this.timeVisit,
    required this.createdAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'] as int,
      placeName: json['placeName'] as String,
      type: json['type'] as String,
      timeVisit: json['timeVisit'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
