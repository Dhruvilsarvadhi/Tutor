class ValidatorUtils {
  // email pattern for regExp
  // static const String emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String emailPattern = r".+@.+";
  // mobile pattern for regExp
  static const String mobilePattern = r"^(?:[+0]9)?[0-9]{10}$";

  //restrict user for space
  static const String restrictSpace = r'\s';
}
