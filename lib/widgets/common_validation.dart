

import '../../../../config.dart';

class CommonValidation {
  //validate for email
  bool isEmail(String str) {
    RegExp email = RegExp(
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    return email.hasMatch(str.toLowerCase());
  }

  bool isPhone(String input) => RegExp(
      r'(^[0-9]{10}$)'
  ).hasMatch(input);

//validate for password
  bool isPassword(String str) {
    RegExp pwd = RegExp(r"^(?:(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*)$");
    return pwd.hasMatch(str);
  }

// Check Id Validation
  String? checkIDValidation(value) {
    if (value.isEmpty) {
      return CommonTextFont().userFieldError;
    } else {
      return null;
    }
  }


// Check Email Validation
  String? checkEmailValidation(value) {
    if (value.isEmpty) {
      return CommonTextFont().userFieldError;
    } else if (CommonValidation().isEmail(value) == false) {
      return CommonTextFont().inCorrectUsername;
    }else {
      return null;
    }
  }


// Check EmailId Or Phone Validation
  String? checkEmailOrPhoneValidation(value) {
    if (!isEmail(value) && !isPhone(value)) {
      return 'Please enter a valid email or phone number.';
    }
    if (value.isEmpty) {
      return CommonTextFont().userFieldError;
    } else {
      return null;
    }
  }

// Check Password Validation
  String? checkPasswordValidation(value) {
    if (value.isEmpty) {
      return CommonTextFont().passwordFieldError;
    } else {
      return null;
    }
  }

// Check Current Password Validation
  String? checkCurrentPasswordValidation(value) {
    if (value.isEmpty) {
      return CommonTextFont().currentPasswordFieldError;
    } else {
      return null;
    }
  }

// Check New Password Validation
  String? checkNewPasswordValidation(value) {
    if (value.isEmpty) {
      return CommonTextFont().newPasswordFieldError;
    }else if (value.length <= 5) {
      return CommonTextFont().passwordMininumValueEnter;
    }  else {
      return null;
    }
  }

// Check Confirm Password Validation
  String? checkConfirmPasswordValidation(value,newPassword) {
    if (value.isEmpty) {
      return CommonTextFont().confirmPasswordFieldError;
    } else if (value.length <= 5) {
      return CommonTextFont().passwordMininumValueEnter;
    }else if (value.toString() != newPassword.toString()) {
      return CommonTextFont().passwordNotMatch;
    } else {
      return null;
    }
  }
}
