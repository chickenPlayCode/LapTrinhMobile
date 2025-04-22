import 'dart:convert';

class Note {
  final int? id;
  final int userId;
  final String title;
  final String content;
  final int priority;
  final DateTime createdAt;
  final DateTime modifiedAt;
  final List<String>? tags;
  final String? color;
  final String? imagePath;
  final String? audioPath; // Thêm trường audioPath

  Note({
    this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.priority,
    required this.createdAt,
    required this.modifiedAt,
    this.tags,
    this.color,
    this.imagePath,
    this.audioPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'content': content,
      'priority': priority,
      'createdAt': createdAt.toIso8601String(),
      'modifiedAt': modifiedAt.toIso8601String(),
      'tags': tags != null ? jsonEncode(tags) : null,
      'color': color,
      'imagePath': imagePath,
      'audioPath': audioPath,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int?,
      userId: map['userId'] as int,
      title: map['title'] as String,
      content: map['content'] as String,
      priority: map['priority'] as int,
      createdAt: DateTime.parse(map['createdAt'] as String),
      modifiedAt: DateTime.parse(map['modifiedAt'] as String),
      tags: map['tags'] != null ? List<String>.from(jsonDecode(map['tags'])) : null,
      color: map['color'] as String?,
      imagePath: map['imagePath'] as String?,
      audioPath: map['audioPath'] as String?,
    );
  }

  Note copyWith({
    int? id,
    int? userId,
    String? title,
    String? content,
    int? priority,
    DateTime? createdAt,
    DateTime? modifiedAt,
    List<String>? tags,
    String? color,
    String? imagePath,
    String? audioPath,
  }) {
    return Note(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      content: content ?? this.content,
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      tags: tags ?? this.tags,
      color: color ?? this.color,
      imagePath: imagePath ?? this.imagePath,
      audioPath: audioPath ?? this.audioPath,
    );
  }
}