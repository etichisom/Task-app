import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/post/cubit/post_cubit.dart';
import 'package:task/feature/post/widget/post_card.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Posts",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocProvider(
        create: (context) => PostCubit(postRepository: context.read()),
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              );
            } else if (state is PostLoaded) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 20,
                    ),
                    child: PostCard(
                      postData: state.posts[index],
                    ),
                  );
                },
              );
            } else if (state is PostError) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
