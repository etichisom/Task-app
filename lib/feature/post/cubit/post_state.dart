part of 'post_cubit.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<PostData> posts;

  PostLoaded(this.posts);
}

class PostError extends PostState {
  final String errorMessage;

  PostError(this.errorMessage);
}
