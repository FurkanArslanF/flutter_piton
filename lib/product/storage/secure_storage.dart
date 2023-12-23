import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  Future<void> writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readSecureData(String key) async {
    var readData = await storage.read(key: key);
    return readData;
  }

  Future<void> deleteSecureData() async {
    await storage.delete(key: "email");
    await storage.delete(key: "password");
    await storage.delete(key: "at");
  }

  Future<void> allDeleteSecureData() async {
    storage.deleteAll();
  }
}
