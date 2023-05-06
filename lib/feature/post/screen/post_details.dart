import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task/feature/post/data/model/post_data.dart';

class PostDetailScreen extends StatelessWidget {
  final PostData postData;
  const PostDetailScreen({Key? key, required this.postData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Posts Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text("user ${postData.id}"),
                leading: CircleAvatar(
                  backgroundColor:Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  child: Text(
                    postData.id.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                postData.title ?? "",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                postData.body ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
