import 'dart:convert';

Event EventFromJson(String str) {
  final jsonData = json.decode(str);
  return Event.fromMap(jsonData);
}

String EventToJson(Event data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Event {
  int id;
  int clnevents_id;
  String event_numb;
  String event_stat;
  DateTime reg_date;
  DateTime change_date;
  String event_descr;

  Event({
    this.id,
    this.clnevents_id,
    this.event_numb,
    this.event_stat,
    this.reg_date,
    this.change_date,
    this.event_descr,
  });

  factory Event.fromMap(Map<String, dynamic> json) => new Event(
        id: json["id"],
        clnevents_id: json["clnevents_id"],
        event_numb: json["event_numb"],
        event_stat: json["event_stat"],
        reg_date: json["reg_date"],
        change_date: json["change_date"],
        event_descr: json["event_descr"],
  );

  Map<String, dynamic> toMap() => {
        "id": id,
        "clnevents_id": clnevents_id,
        "event_numb": event_numb,
        "event_stat": event_stat,
        "reg_date": reg_date,
        "change_date": change_date,
        "event_descr": event_descr,
      };
}
