import 'package:example_proj/data/models/user/user.dart';

abstract class UserServiceInterface {
  Future<List<User>?>? getUsers();
  Future<User?>? getUserById({required int id});
}
