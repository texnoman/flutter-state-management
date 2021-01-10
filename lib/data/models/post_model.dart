import 'package:equatable/equatable.dart';
import 'package:fake_posts/data/models/user_model.dart';

class PostModel extends Equatable {
  final String text;
  final String image;
  final int likes;
  final String link;
  final List<String> tags;
  final String publishDate;
  final UserModel owner;

  PostModel({
    this.text,
    this.image,
    this.likes,
    this.link,
    this.tags,
    this.publishDate,
    this.owner,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    if (null == map) return null;
    var tags = List<String>();
    map['tags'].forEach((tag) {
      tags.add(tag);
    });
    return PostModel(
      image: map['image'],
      likes: map['likes'],
      link: map['link'],
      owner: UserModel.fromMap(map['owner']),
      publishDate: map['publishDate'],
      tags: tags,
      text: map['text'],
    );
  }

  @override
  List<Object> get props => [
        text,
        image,
        likes,
        link,
        tags,
        publishDate,
        owner,
      ];
}
