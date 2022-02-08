import 'package:example_proj/data/models/user/user.dart';
import 'package:example_proj/services/project/user/user_service_interface.dart';
import 'package:stacked/stacked.dart';

class UsersViewModel extends BaseViewModel {
  final UserServiceInterface _service;
  UsersViewModel(this._service);

  List<User>? users;

  Future onReady() async {
    setBusy(true);
    if (hasError) setError(false);

    final data = await _service.getUsers();
    if (data != null) {
      users = data;
    } else {
      setError(true);
    }
    setBusy(false);
    notifyListeners();
  }
}
