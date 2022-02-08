import 'package:example_proj/services/project/post/post_service_interface.dart';
import 'package:example_proj/services/project/user/user_service_interface.dart';
import 'package:example_proj/services/storage/secure/secure_storage_interface.dart';

class RootContainer {
  // final CoreApiInterface _coreApiInterface;
  final PostServiceInterface postServiceInterface;
  final UserServiceInterface userServiceInterface;
  final SecureStorageServiceInterface secureStorageServiceInterface;

  RootContainer({
    required this.postServiceInterface,
    required this.secureStorageServiceInterface,
    required this.userServiceInterface,
  });
}
