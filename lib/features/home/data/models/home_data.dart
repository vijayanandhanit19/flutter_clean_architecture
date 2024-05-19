import 'dart:convert';

class HomeData {
  final String title;
  final String message;

  HomeData({
    required this.title,
    required this.message,
  });

  HomeData copyWith({
    String? title,
    String? message,
  }) {
    return HomeData(
      title: title ?? this.title,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'message': message,
    };
  }

  factory HomeData.fromMap(Map<String, dynamic> map) {
    return HomeData(
      title: map['title'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeData.fromJson(String source) =>
      HomeData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomeData(title: $title, message: $message,)';
  }

  @override
  bool operator ==(covariant HomeData other) {
    if (identical(this, other)) return true;

    return other.title == title && other.message == message;
  }

  @override
  int get hashCode {
    return title.hashCode ^ message.hashCode;
  }
}
