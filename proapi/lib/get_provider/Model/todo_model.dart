
import 'dart:convert';

Todo todoFromMap(String str) => Todo.fromMap(json.decode(str));

String todoToMap(Todo data) => json.encode(data.toMap());

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool isCompleted;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  Todo copyWith({
    int? userId,
    int? id,
    String? title,
    bool? isCompleted,
  }) =>
      Todo(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        isCompleted: isCompleted ?? this.isCompleted,
      );

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    isCompleted: json["isCompleted"]==1,
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "id": id,
    "title": title,
    "isCompleted": isCompleted,
  };
}