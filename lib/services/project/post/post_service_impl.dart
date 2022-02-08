import 'package:example_proj/data/data_providers/posts/posts_data_provider_interface.dart';
import 'package:example_proj/data/models/post/post.dart';
import 'package:example_proj/services/project/post/post_service_interface.dart';

class PostServiceImpl implements PostServiceInterface {
  final PostsDataProviderInterface _dataProvider;

  PostServiceImpl(this._dataProvider);

  @override
  Future<List<Post>?>? getPosts() async {
    try {
      final result = await _dataProvider.getPosts();

      return result.map((e) => Post.fromJson(e!)).toList();
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<Post>?>? getPostsByUser({required int userId}) async {
    try {
      final result = await _dataProvider.getPostsByUser(userId: userId);

      return result.map((e) => Post.fromJson(e!)).toList();
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<Post?>? getPostById({required int id}) {
    return null;
  }
}
