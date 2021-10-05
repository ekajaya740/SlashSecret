import 'files_database.dart';

class AccountDatabase {
  String username;
  String password;
  String pin;
  List<FilesDatabase> files;

  AccountDatabase(
      {required this.username,
      required this.password,
      required this.pin,
      required this.files});
}

var accounts = [
  AccountDatabase(username: "s", password: "p", pin: "123456", files: files),
];
