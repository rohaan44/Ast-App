import 'package:ast_official/generated/l10n.dart';
import 'package:flutter/material.dart';

class AtheletChatController extends ChangeNotifier {
  late S delegate;

  final chats = [
    {
      "name": "John Doe",
      "message": "Ecco i miei bicipiti, e sono pronto/a...",
      "time": "1:31 PM",
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
      "unread": 0,
      "isOnline": false
    },
    {
      "name": "Mitchel Johnson",
      "message": "Giochiamo intelligente—aggiungi 2,5 kg...",
      "time": "2:00 PM",
      "image": "https://randomuser.me/api/portraits/men/2.jpg",
      "unread": 2,
      "isOnline": true
    },
    {
      "name": "Max William",
      "message": "Sent photo 📷",
      "time": "2:00 PM",
      "image": "https://randomuser.me/api/portraits/men/3.jpg",
      "unread": 1,
      "isOnline": false,
    },
    {
      "name": "David Warner",
      "message": "😊 Questo è l’obiettivo! Ti stai adattando...",
      "time": "2:00 PM",
      "image": "https://randomuser.me/api/portraits/men/4.jpg",
      "unread": 1,
      "isOnline": false
    },
    {
      "name": "Emily Carter",
      "message": "😊 Questo è l’obiettivo! Ti stai adattando...",
      "time": "2:00 PM",
      "image": "https://randomuser.me/api/portraits/women/5.jpg",
      "unread": 1,
      "isOnline": true
    },
    {
      "name": "Chris Brown",
      "message": "😊 Questo è l’obiettivo! Ti stai adattando...",
      "time": "2:00 PM",
      "image": "https://randomuser.me/api/portraits/men/6.jpg",
      "unread": 1,
      "isOnline": false
    },
    {
      "name": "Brooklyn Simmons",
      "message": "😊 Questo è l’obiettivo! Ti stai adattando...",
      "time": "2:00 PM",
      "image": "https://randomuser.me/api/portraits/men/7.jpg",
      "unread": 1,
      "isOnline": false
    },
  ];
}
