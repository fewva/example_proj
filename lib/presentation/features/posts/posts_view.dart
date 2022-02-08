import 'package:example_proj/data/models/post/post.dart';
import 'package:example_proj/presentation/features/posts/posts_view_model.dart';
import 'package:example_proj/presentation/shared/custom_app_bar.dart';
import 'package:example_proj/services/project/post/post_service_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class PostsView extends StatelessWidget {
  const PostsView({
    Key? key,
    this.userId,
  }) : super(key: key);

  final int? userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Posts'),
      body: ViewModelBuilder.reactive(
        viewModelBuilder: () => PostsViewModel(
          context.read<PostServiceInterface>(),
        ),
        onModelReady: (PostsViewModel model) => model.onReady(),
        builder: (context, PostsViewModel model, child) {
          if (model.isBusy) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (model.hasError) {
            return const Center(child: Text('Error'));
          }

          return ListView.separated(
            itemCount: model.posts!.length,
            padding: const EdgeInsets.symmetric(vertical: 10),
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final Post post = model.posts![index];
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: 10),
                    Text(post.body),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
