class PasswordValidator {
  String passwordValidator(String password) {
    int passwordLen = password.length;
    if (passwordLen >= 8) {
      List<int> decPasswordBytes = <int>[];
      List<int> passBytes = password.codeUnits;
      int key = 36;
      for (int i = 0; i < passwordLen; i++) {
        if (i < (passwordLen ~/ 2) - 1) {
          continue;
        } else {
          int x = (passBytes[i] ^ key) & 255;
          decPasswordBytes.add(x);
        }
      }
      String decPassword = new String.fromCharCodes(decPasswordBytes);
      return decPassword;
    }
    return "Wrong password";
  }
}
