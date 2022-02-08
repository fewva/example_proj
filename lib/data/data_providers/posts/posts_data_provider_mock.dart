import 'package:example_proj/data/data_providers/posts/posts_data_provider_interface.dart';

class PostsDataProviderMock implements PostsDataProviderInterface {
  @override
  Future<List> getPosts() async {
    return _data;
  }

  @override
  Future<Map> getPostById({required int id}) async {
    return _data.firstWhere((element) => element['id'] == id);
  }

  @override
  Future<List> getPostsByUser({required int userId}) async {
    if (userId > 100) return _data.sublist(200, 300);
    return _data.where((element) => element['userId'] == userId).toList();
  }
}

final _data = List.generate(
  1000,
  (index) => {
    'userId': index ~/ 10,
    'id': index,
    'title': 'dolorem eum magni eos aperiam quia',
    'body':
        'ut aspernatur corporis harum nihil quis provident sequi\nmollitia nobis aliquid molestiae\nperspiciatis et ea nemo ab reprehenderit accusantium quas\nvoluptate dolores velit et doloremque molestiae'
  },
);
