import 'package:dio/dio.dart';
import 'package:example_proj/core/root/root_container.dart';
import 'package:example_proj/data/data_providers/posts/posts_data_provider_mock.dart';
import 'package:example_proj/data/data_providers/posts/posts_data_provider_remote.dart';
import 'package:example_proj/data/data_providers/users/users_data_provider_mock.dart';
import 'package:example_proj/data/data_providers/users/users_data_provider_remote.dart';
import 'package:example_proj/services/network/core_api_impl.dart';
import 'package:example_proj/services/network/core_api_interface.dart';
import 'package:example_proj/services/project/post/post_service_impl.dart';
import 'package:example_proj/services/project/post/post_service_interface.dart';
import 'package:example_proj/services/project/user/user_service_impl.dart';
import 'package:example_proj/services/project/user/user_service_interface.dart';
import 'package:example_proj/services/storage/secure/secure_storage_impl.dart';
import 'package:example_proj/services/storage/secure/secure_storage_interface.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum Enviroment { mock, dev, prod }

Future<RootContainer> getContainer({
  Enviroment enviroment = Enviroment.dev,
}) async {
  late final PostServiceInterface postService;
  late final UserServiceInterface userService;

  if (enviroment == Enviroment.dev || enviroment == Enviroment.prod) {
    final CoreApiInterface _coreApiImpl = DioCoreApi(
      Dio(
        BaseOptions(
          baseUrl: 'https://jsonplaceholder.typicode.com',
          connectTimeout: 20000,
        ),
      )..interceptors.add(LoggyDioInterceptor(responseBody: false)),
    );
    postService = PostServiceImpl(PostsDataProviderImpl(_coreApiImpl));

    userService = UserServiceImpl(
      UsersDataProviderImpl(_coreApiImpl),
    );
  } else {
    postService = PostServiceImpl(PostsDataProviderMock());
    userService = UserServiceImpl(UsersDataProviderMock());
  }

  final SecureStorageServiceInterface secureStorageServiceInterface =
      SecureStorageServiceImpl(const FlutterSecureStorage());

  return RootContainer(
    postServiceInterface: postService,
    secureStorageServiceInterface: secureStorageServiceInterface,
    userServiceInterface: userService,
  );
}
