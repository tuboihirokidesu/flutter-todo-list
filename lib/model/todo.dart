// import 'dart:ui';

import 'package:flutter/material.dart';

class Todo {
  DateTime createdTime;
  String title;
  String description;
  String id;
  bool isDone;

  Todo(
      {@required this.createdTime,
      @required this.title,
      this.description = '',
      this.isDone = false,
      this.id});
}

// import 'package:meta/meta.dart';

// class NotificationSetting {
//   String title;
//   bool value;

//   NotificationSetting({
//     @required this.title,
//     this.value = false,
//   });
// }

// class CardItem {
//   final String title;
//   final String urlImage;
//   final Color color;
//   final bool isTapped;

//   const CardItem({
//     @required this.title,
//     @required this.urlImage,
//     @required this.color,
//     this.isTapped = false,
//   });

//   CardItem copy({
//     String title,
//     String urlImage,
//     Color color,
//     bool isTapped,
//   }) =>
//       CardItem(
//         title: title ?? this.title,
//         urlImage: urlImage ?? this.urlImage,
//         color: color ?? this.color,
//         isTapped: isTapped ?? this.isTapped,
//       );
// }
