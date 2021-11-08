class EventDetail {
  EventDetail({
    required this.name,
    required this.desc,
    this.image = "assets/bitmap/header_bg.png",
  });
  final String name;
  final String desc;
  String image;
}

List data = List<EventDetail>.generate(
    10, (i) => EventDetail(name: "Hallo", desc: "oakwoakwokawok"));
