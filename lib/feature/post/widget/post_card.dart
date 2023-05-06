import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/route/app_pages.dart';
import 'package:task/feature/post/data/model/post_data.dart';

class PostCard extends StatelessWidget {
  final PostData postData;
  const PostCard({Key? key, required this.postData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppPages.postDetails, extra: postData);
      },
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text("user ${postData.id}"),
                leading: CircleAvatar(
                  backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  child: Text(
                    postData.id.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                postData.title ?? "",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                postData.body ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Read More>>",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
