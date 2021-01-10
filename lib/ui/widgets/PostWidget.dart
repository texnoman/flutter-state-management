import 'package:fake_posts/data/models/post_model.dart';
import 'package:fake_posts/data/utils/base_utils.dart';
import 'package:fake_posts/data/utils/const_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Post ni UI ga chiqarish uchun
class PostWidget extends StatelessWidget {
  final PostModel postModel;

  /// [postModel] - UI ga chiqadigan ma'lumotni olish uchun.
  PostWidget({this.postModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            divider(),
            bodyImage(),
            tags(context),
            textWithEllipsis(context, postModel.text),
            textWithEllipsis(context, postModel.link),
            divider(),
            likesAndDate(),
          ],
        ),
      ),
    );
  }

  Widget likesAndDate() {
    return Row(
      children: [
        Icon(
          Icons.thumb_up,
          color: Colors.blue,
        ),
        Text(
          "${postModel.likes} Likes",
          style: TextStyle(fontSize: 18),
        ),
        Spacer(),
        Text(
          BaseUtils.formatDateWithTime(postModel.publishDate),
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget textWithEllipsis(BuildContext context, String text) {
    return Text(
      text ?? "",
      style: TextStyle(fontSize: 18),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget tags(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: postModel.tags.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Text(
              postModel.tags[index],
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }

  Widget bodyImage() {
    return FadeInImage.assetNetwork(
      placeholder: ConstUtils.DEFAULT_IMG,
      image: postModel.image,
      fit: BoxFit.cover,
    );
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Container(
        color: Colors.grey,
        height: 1,
      ),
    );
  }

  Widget header() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            postModel.owner.picture,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${postModel.owner.firstName} ${postModel.owner.lastName}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(postModel.owner.email ?? ""),
          ],
        ),
      ],
    );
  }
}
