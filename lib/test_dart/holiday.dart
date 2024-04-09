import 'package:equatable/equatable.dart';
import 'dart:convert';

class Hodiday extends Equatable {
    Hodiday({
        required this.isHoliday,
        required this.events,
    });

    final bool? isHoliday;
    static const String isHolidayKey = "is_holiday";
    
    final List<Event> events;
    static const String eventsKey = "events";
    

    Hodiday copyWith({
        bool? isHoliday,
        List<Event>? events,
    }) {
        return Hodiday(
            isHoliday: isHoliday ?? this.isHoliday,
            events: events ?? this.events,
        );
    }

    factory Hodiday.fromJson(Map<String, dynamic> json){ 
        return Hodiday(
            isHoliday: json["is_holiday"],
            events: json["events"] == null ? [] : List<Event>.from(json["events"]!.map((x) => Event.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "is_holiday": isHoliday,
        "events": events.map((x) => x?.toJson()).toList(),
    };

    @override
    String toString(){
        return "$isHoliday, $events, ";
    }

    @override
    List<Object?> get props => [
    isHoliday, events, ];

}

class Event extends Equatable {
    Event({
        required this.description,
        required this.additionalDescription,
        required this.isHoliday,
        required this.isReligious,
    });

    final String? description;
    static const String descriptionKey = "description";
    
    final String? additionalDescription;
    static const String additionalDescriptionKey = "additional_description";
    
    final bool? isHoliday;
    static const String isHolidayKey = "is_holiday";
    
    final bool? isReligious;
    static const String isReligiousKey = "is_religious";
    

    Event copyWith({
        String? description,
        String? additionalDescription,
        bool? isHoliday,
        bool? isReligious,
    }) {
        return Event(
            description: description ?? this.description,
            additionalDescription: additionalDescription ?? this.additionalDescription,
            isHoliday: isHoliday ?? this.isHoliday,
            isReligious: isReligious ?? this.isReligious,
        );
    }

    factory Event.fromJson(Map<String, dynamic> json){ 
        return Event(
            description: json["description"],
            additionalDescription: json["additional_description"],
            isHoliday: json["is_holiday"],
            isReligious: json["is_religious"],
        );
    }

    Map<String, dynamic> toJson() => {
        "description": description,
        "additional_description": additionalDescription,
        "is_holiday": isHoliday,
        "is_religious": isReligious,
    };

    @override
    String toString(){
        return "$description, $additionalDescription, $isHoliday, $isReligious, ";
    }

    @override
    List<Object?> get props => [
    description, additionalDescription, isHoliday, isReligious, ];

}

/*
{
	"is_holiday": true,
	"events": [
		{
			"description": "پیروزی انقلاب اسلامی",
			"additional_description": "",
			"is_holiday": true,
			"is_religious": false
		},
		{
			"description": "تولد توماس ادیسون",
			"additional_description": "11 February",
			"is_holiday": false,
			"is_religious": false
		},
		{
			"description": "حمله به سفارت روسیه و قتل گریبایدوف سفیر روسیه تزاری در ایران",
			"additional_description": "11 February",
			"is_holiday": false,
			"is_religious": false
		}
	]
}*/

  /*
  void HodidayGet() {
    var t;

    final bool? isHoliday;
    isHoliday = null;
    Hodiday lHo = Hodiday(isHoliday: true, events: [
      Event(description: "so", title: 't'),
      Event(description: "sa", title: 'p')
    ]);
    Hodiday lHo2;
    String jsonData =
        '{"is_holiday": true,	"events": [	{	"title":"t", "description": "پیروزی انقلاب اسلامی"}]} ';

    var user = jsonDecode(jsonData) as Map<String, dynamic>;
    lHo = Hodiday.fromJson(user);

    jsonData =
        '{"is_holiday": true,	"events": [	{	"title":"t", "description": "ی"}]} ';

    user = jsonDecode(jsonData) as Map<String, dynamic>;

    lHo2 = Hodiday.fromJson(user);
    print('************************');
    print(lHo2.toString());
  }
   */

