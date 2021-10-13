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
  AccountDatabase(
      username: "SlashRoot5_4dMo0n",
      password: "Z`oKvU}ZtKK]zKPtKjjWVzKQkaWaGvApLM``AjFApSAAjPsKlAeVPw",
      pin: "977978",
      files: [
        FilesDatabase(
            fileName: 'Secret',
            isLocked: true,
            fileContent:
                "c!Rq[S!vZZuTVzKP!vZsL!sUqaW!WLiZUU`VaORwHEWLVKKP_BMv{MWgKi{Bvi{Pl{FvApL{JkP{Pl{IQwgHY"),
        FilesDatabase(
            fileName: "Is This Secret?", isLocked: false, fileContent: "No"),
        FilesDatabase(
            fileName: "Not a secret bro",
            isLocked: false,
            fileContent: "https://www.youtube.com/watch?v=PZqx-lMZHM0"),
        FilesDatabase(
            fileName: "Secret bro probably",
            isLocked: false,
            fileContent: "Ini bro https://www.youtube.com/watch?v=dQw4w9WgXcQ"),
        FilesDatabase(fileName: "Secret 2", isLocked: true, fileContent: "No"),
        FilesDatabase(
            fileName: "Sacred", isLocked: true, fileContent: "__import__"),
        FilesDatabase(fileName: "Cwk", isLocked: false, fileContent: "Hai CWK")
      ]),
];
