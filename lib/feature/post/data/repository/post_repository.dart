import 'package:task/core/error/expection.dart';
import 'package:task/core/service/network.dart';
import 'package:task/feature/post/data/model/post_data.dart';

abstract class PostRepositoryImpl {
  Future<List<PostData>> getPost();
}

class PostRepository extends PostRepositoryImpl {
  final NetworkService networkService;
  PostRepository(this.networkService);

  @override
  Future<List<PostData>> getPost() async {
    List<PostData> list = [];
    try {
      var data = await networkService.get(path: '/posts');
      for (var e in data.data) {
        list.add(PostData.fromJson(e));
      }
      return list;
    } on CustomException catch (e) {
      throw e.message;
    } catch (e) {
      throw "Something went wrong";
    }
  }
}
