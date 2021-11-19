class EventDetailModel {
  EventDetailModel({
    required this.name,
    required this.desc,
    this.image = "assets/bitmap/header_bg.png",
  });
  final String name;
  final String desc;
  String image;
}
