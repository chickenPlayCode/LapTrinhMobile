import 'dart:convert';
import 'package:flutter/material.dart';

class Note {
  int? id;
  String title;
  String content;
  int priority;
  DateTime createdAt;
  DateTime modifiedAt;
  List<String>? tags;
  String? color;
  String? imagePath;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.priority,
    required this.createdAt,
    required this.modifiedAt,
    this.tags,
    this.color,
    this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'priority': priority,
      'createdAt': createdAt.toIso8601String(),
      'modifiedAt': modifiedAt.toIso8601String(),
      'tags': tags?.join(','), // Chuyển List<String> thành chuỗi
      'color': color,
      'imagePath': imagePath,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] is String ? int.parse(map['id']) : map['id'],
      title: map['title'],
      content: map['content'],
      priority: map['priority'] is String ? int.parse(map['priority']) : map['priority'],
      createdAt: DateTime.parse(map['createdAt']),
      modifiedAt: DateTime.parse(map['modifiedAt']),
      tags: map['tags'] != null ? (map['tags'] as String).split(',') : null,
      color: map['color'],
      imagePath: map['imagePath'],
    );
  }

  Note copyWith({
    int? id,
    String? title,
    String? content,
    int? priority,
    DateTime? createdAt,
    DateTime? modifiedAt,
    List<String>? tags,
    String? color,
    String? imagePath,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      tags: tags ?? this.tags,
      color: color ?? this.color,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  // Phương thức xử lý màu sắc an toàn
  Color getColor() {
    if (color == null || color!.isEmpty) {
      return Colors.white; // Màu mặc định nếu color là null hoặc rỗng
    }
    try {
      String hexColor = color!.replaceAll('#', ''); // Loại bỏ ký tự '#'
      // Đảm bảo chuỗi có 6 ký tự (RRGGBB), nếu không thì thêm FF (alpha channel)
      if (hexColor.length == 6) {
        hexColor = 'FF$hexColor'; // Thêm FF để có định dạng AARRGGBB
      } else if (hexColor.length != 8) {
        return Colors.white; // Trả về màu mặc định nếu định dạng không hợp lệ
      }
      return Color(int.parse(hexColor, radix: 16));
    } catch (e) {
      print('Lỗi khi phân tích màu: $e');
      return Colors.white; // Trả về màu mặc định nếu có lỗi
    }
  }

  @override
  String toString() {
    return 'Note(id: $id, title: $title, priority: $priority, imagePath: $imagePath)';
  }
}