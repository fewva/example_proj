import 'package:example_proj/services/storage/secure/secure_storage_interface.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageServiceImpl implements SecureStorageServiceInterface {
  final FlutterSecureStorage _storage;

  SecureStorageServiceImpl(this._storage);

  @override
  Future<bool> saveData(String key, String data) async {
    await _storage.write(key: key, value: data);
    return true;
  }

  @override
  Future<bool> clear() async {
    await _storage.deleteAll();
    return true;
  }

  @override
  Future<bool> removeData(String key) async {
    await _storage.delete(key: key);
    return true;
  }

  @override
  Future<String> readData(String key) async {
    final result = await _storage.read(key: key);
    return result!;
  }

  @override
  Future<Map<String, String>> readAll() async {
    final result = await _storage.readAll();
    return result;
  }
}
