import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String postedBy;
  final String timestamp;
  final String title;
  final List<dynamic> tags;
  final String description;
  final int likes;
  final int comments;
  final int shares;
  final bool isLiked;

  Post(
      {this.postedBy,
      this.timestamp,
      this.likes,
      this.title,
      this.tags,
      this.description,
      this.comments,
      this.shares,
      this.isLiked});

  Post.fromMap(Map<String, dynamic> json)
      : postedBy = json['postedBy'],
        timestamp = json['timestamp'],
        title = json['title'],
        description = json['description'],
        tags = json['tags'],
        likes = json['likes'],
        comments = json['comments'],
        shares = json['shares'],
        isLiked = json['isLiked'];

  Map<String, dynamic> toJson() => {
        'postedBy': postedBy,
        'timestamp': timestamp,
        'title': title,
        'description': description,
        'tags': tags,
        'likes': likes,
        'comments': comments,
        'shares': shares,
        'isLiked': isLiked,
      };
}
