class PinValidator {
  String pinValidator(String pin) {
    int pinLen = pin.length;
    int key = 77;
    if (pinLen == 6) {
      List<int> pinOrds = pin.codeUnits;
      List<int> decsIntPinList = <int>[];
      for (int i = 0; i < pinLen; i++) {
        int decsIntPin = (((pinOrds[i] + 70) ^ key) & 255);
        decsIntPinList.add(decsIntPin);
      }

      String decPin = new String.fromCharCodes(decsIntPinList);
      return decPin;
    }
    return "Your PIN Length is Wrong";
  }
}
