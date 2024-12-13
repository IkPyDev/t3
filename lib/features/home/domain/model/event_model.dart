/*
 [
    {
      "id": 1,
      "title": "Die Antwoord",
      "town": "Будапешт",
      "price": {
        "value": 5000
      }
    },
    {
      "id": 2,
      "title": "Socrat&Lera",
      "town": "Санкт-Петербург",
      "price": {
        "value": 1999
      }
    },
    {
      "id": 3,
      "title": "Лампабикт",
      "town": "Москва",
      "price": {
        "value": 2390
      }
    }
  ]
*/

import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  final int id;
  final String title;
  final String town;
  final EventPrice price;

  const EventModel({required this.id, required this.title, required this.town, required this.price});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      town: json['town'],
      price: EventPrice.fromJson(json['price']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'town': town,
      'price': price.toJson(),
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, town, price];
}

class EventPrice extends Equatable {
  final int value;

  const EventPrice({required this.value});

  factory EventPrice.fromJson(Map<String, dynamic> json) {
    return EventPrice(value: json['value']);
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [int];
}
