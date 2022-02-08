import 'package:example_proj/data/models/post/post.dart';
import 'package:example_proj/services/project/post/post_service_interface.dart';
import 'package:stacked/stacked.dart';

class PostsViewModel extends BaseViewModel {
  final PostServiceInterface _service;
  final int? userId;

  PostsViewModel(this._service, {this.userId});

  List<Post>? posts;

  Future onReady() async {
    setBusy(true);
    if (hasError) setError(false);
    final data = userId != null
        ? await _service.getPostsByUser(userId: userId!)
        : await _service.getPosts();
    if (data != null) {
      posts = data;
    } else {
      setError(true);
    }
    setBusy(false);
    notifyListeners();
  }
}
