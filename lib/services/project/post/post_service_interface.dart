import 'package:example_proj/data/models/post/post.dart';

abstract class PostServiceInterface {
  Future<List<Post>?>? getPosts();
  Future<List<Post>?>? getPostsByUser({required int userId});
  Future<Post?>? getPostById({required int id});
}
