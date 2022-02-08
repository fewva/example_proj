abstract class UsersDataProviderInterface {
  Future<List> getUsers();
  Future<Map> getUserById({required int id});
}
