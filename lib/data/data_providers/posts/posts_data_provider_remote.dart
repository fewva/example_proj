import 'package:example_proj/data/data_providers/posts/posts_data_provider_interface.dart';
import 'package:example_proj/services/network/core_api_interface.dart';

class PostsDataProviderImpl implements PostsDataProviderInterface {
  final CoreApiInterface _coreApi;

  PostsDataProviderImpl(this._coreApi);

  @override
  Future<List> getPosts() async {
    final response = await _coreApi.getRequest('/posts');
    return response!.data;
  }

  @override
  Future<Map> getPostById({required int id}) async {
    final response = await _coreApi.getRequest('/posts/$id');
    return response!.data;
  }

  @override
  Future<List> getPostsByUser({required int userId}) async {
    final response = await _coreApi.getRequest('/posts?userId=$userId');
    return response!.data;
  }
}
