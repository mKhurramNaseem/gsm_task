class TextFieldValidations {
  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return "Required Fields";
    } else if (value.length <= 3) {
      return "Name must be at least 3 character's";
    } else {
      return null;
    }
  }

  static String? validateEmailAddress(String? value) {
    if (value!.isEmpty) {
      return "Required Fields";
    } else if (!(value.contains("@gmail.com"))) {
      return "Invalid Email Address";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Required Fields";
    } else if (value.length <= 3) {
      return "Password must be at least 3 character's";
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? value) {
    if (value!.isEmpty) {
      return "Required Fields";
    } else if (value.length <= 10 ||
        !(value.codeUnits.every((element) => element >= 48 && element <= 57))) {
      return "Invalid Phone Number";
    } else {
      return null;
    }
  }
}
