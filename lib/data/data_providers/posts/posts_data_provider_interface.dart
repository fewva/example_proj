abstract class PostsDataProviderInterface {
  Future<List> getPosts();
  Future<List> getPostsByUser({required int userId});
  Future<Map> getPostById({required int id});
}
