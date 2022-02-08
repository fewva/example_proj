import 'package:beamer/beamer.dart';
import 'package:example_proj/core/root/get_container.dart';
import 'package:example_proj/core/root/init_packages.dart';
import 'package:example_proj/core/root/root_container.dart';
import 'package:example_proj/presentation/features/posts/posts_view.dart';
import 'package:example_proj/presentation/features/users/users_view.dart';
import 'package:example_proj/services/project/post/post_service_interface.dart';
import 'package:example_proj/services/project/user/user_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await initPackages();

  final RootContainer diContainer =
      await getContainer(enviroment: Enviroment.mock);

  runApp(MyApp(diContainer: diContainer));
}

class MyApp extends StatelessWidget {
  final RootContainer diContainer;

  MyApp({Key? key, required this.diContainer}) : super(key: key);

  final _routerDelegate = BeamerDelegate(
    initialPath: '/users',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/users': (context, state, data) => const UsersView(),
        // '/posts': (context, state, data) => const PostsView(),
        '/posts/:userId': (context, state, data) => PostsView(
              userId: int.tryParse(state.pathParameters['userId']!),
            ),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PostServiceInterface>.value(
          value: diContainer.postServiceInterface,
        ),
        Provider<UserServiceInterface>.value(
          value: diContainer.userServiceInterface,
        ),
      ],
      child: MaterialApp.router(
        routeInformationParser: BeamerParser(),
        routerDelegate: _routerDelegate,
        showPerformanceOverlay: true,
        backButtonDispatcher:
            BeamerBackButtonDispatcher(delegate: _routerDelegate),
        title: 'Flutter Demo',
      ),
    );
  }
}
