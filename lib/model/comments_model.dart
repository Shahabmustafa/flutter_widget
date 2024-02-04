import 'package:flutter/cupertino.dart';

@immutable
class Comment {
  const Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, Object?> json) {
    return Comment(
        postId: json["postId"] as int,
        id: json["id"] as int,
        name: json["name"] as String,
        email: json["email"] as String,
        body: json["body"] as String
    );
  }

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
}){
    return Comment(
        postId: postId ?? this.postId,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        body: body ?? this.body,
    );
  }

  Map<String, Object?> toJson() {
    return {
      "postId" : postId,
      "id" : id,
      "name" : name,
      "email" : email,
      "body" : body,
    };
  }

  @override
  String toString(){
    return 'CommentModel('
        'postId: $postId},'
        'id: $id,'
        'name: $name,'
        'email: $email,'
        'body: $body,'
        ')';
  }

  @override
  bool operator == (Object other){
    return other is Comment &&
        runtimeType == other.runtimeType &&
        postId == other.postId &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        body == other.body;
  }


  @override
  int get hashCode{
    return Object.hash(
      runtimeType,
      postId,
      id,
      name,
      email,
      body,
    );
  }
}