import 'package:example_proj/data/data_providers/users/users_data_provider_interface.dart';
import 'package:example_proj/services/network/core_api_interface.dart';

class UsersDataProviderImpl implements UsersDataProviderInterface {
  final CoreApiInterface _coreApi;

  UsersDataProviderImpl(this._coreApi);

  @override
  Future<List> getUsers() async {
    final response = await _coreApi.getRequest('/users');
    return response!.data;
  }

  @override
  Future<Map> getUserById({required int id}) async {
    final response = await _coreApi.getRequest('/users/$id');
    return response!.data;
  }
}
