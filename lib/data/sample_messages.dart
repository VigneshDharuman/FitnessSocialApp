import '../models/message.dart';

final List<Message> messages = [
  Message(
    name: "John Smith",
    lastMessage: "Hi! How’s your workout?",
    avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
    time: "2m",
    unreadCount: 2,
  ),
  Message(
    name: "Coach Mike",
    lastMessage: "Sent a video",
    avatarUrl: "https://randomuser.me/api/portraits/men/2.jpg",
    time: "5m",
    unreadCount: 1,
  ),
  Message(
    name: "Trainer Amy",
    lastMessage: "Ok, see you tomorrow!",
    avatarUrl: "https://randomuser.me/api/portraits/women/1.jpg",
    time: "1h",
    unreadCount: 0,
  ),
];
