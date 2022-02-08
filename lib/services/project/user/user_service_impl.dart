import 'package:example_proj/data/data_providers/users/users_data_provider_interface.dart';
import 'package:example_proj/data/models/user/user.dart';
import 'package:example_proj/services/project/user/user_service_interface.dart';

class UserServiceImpl implements UserServiceInterface {
  final UsersDataProviderInterface _dataProvider;

  UserServiceImpl(this._dataProvider);

  @override
  Future<List<User>?>? getUsers() async {
    try {
      final result = await _dataProvider.getUsers();

      return result.map((e) => User.fromJson(e!)).toList();
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<User?>? getUserById({required int id}) {
    return null;
  }
}
