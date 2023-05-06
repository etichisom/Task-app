import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/post/data/model/post_data.dart';
import 'package:task/feature/post/data/repository/post_repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostRepository postRepository;
  PostCubit({required this.postRepository}) : super(PostInitial()) {
    _loadPost();
  }

  _loadPost() async {
    emit(PostLoading());
    postRepository.getPost().then((value) {
      emit(PostLoaded(value));
    }).catchError((e) {
      emit(PostError(e.toString()));
    });
  }
}
