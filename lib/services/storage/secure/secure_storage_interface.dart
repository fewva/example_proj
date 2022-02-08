abstract class SecureStorageServiceInterface {
  Future<bool> saveData(String key, String data);
  Future<String> readData(String key);

  Future<Map<String, String>> readAll();
  Future<bool> removeData(String key);
  Future<bool> clear();
}
