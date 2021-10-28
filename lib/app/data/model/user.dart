import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  //flutter packages get -v
  final String firstName;
  final String lustName;
  final String id;
  final List<String> favorites;

  User(this.id, this.firstName, this.lustName, this.favorites);

  factory User.fromDataset(QueryDocumentSnapshot dataSnapshot) {
    return User.fromJson(
        (dataSnapshot.data() as Map<dynamic, dynamic>).cast<String, dynamic>());
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
