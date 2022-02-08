import 'package:example_proj/data/data_providers/users/users_data_provider_interface.dart';

class UsersDataProviderMock implements UsersDataProviderInterface {
  UsersDataProviderMock();

  @override
  Future<List> getUsers() async {
    return _data;
  }

  @override
  Future<Map> getUserById({required int id}) async {
    return _data[2];
  }
}

final _data = List.generate(
  1000,
  (index) => {
    'id': index,
    'name': 'Clementina DuBuque',
    'username': 'Moriah.Stanton',
    'email': 'Rey.Padberg@karina.biz',
    'address': {
      'street': 'Kattie Turnpike',
      'suite': 'Suite 198',
      'city': 'Lebsackbury',
      'zipcode': '31428-2261',
      'geo': {'lat': '-38.2386', 'lng': '57.2232'}
    },
    'phone': '024-648-3804',
    'website': 'ambrose.net',
    'company': {
      'name': 'Hoeger LLC',
      'catchPhrase': 'Centralized empowering task-force',
      'bs': 'target end-to-end models'
    }
  },
);
