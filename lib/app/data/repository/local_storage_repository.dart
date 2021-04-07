import 'package:fluvistar/app/domain/model/user.dart';

abstract class LocalStorageRepositoryInterface {
  // Contract
  Future<String> getToken();
  Future<String> saveToken(String token);
  Future<void> clearAllData();
  Future<User> saveUser(User user);
  Future<User> getUser();
  Future<void> saveDarkMode(bool darkMode);
  Future<bool> isDarkMode();
}
