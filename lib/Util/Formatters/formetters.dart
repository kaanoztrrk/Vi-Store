import 'package:intl/intl.dart';

class ViFormatter {
  static String formateData(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String fotmatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)} ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)})';
    } else {
      return phoneNumber;
    }
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    var digitsOnly =
        phoneNumber.replaceAll(RegExp(r'\D'), ''); // Use correct variable name

    // Handle short or invalid input
    if (digitsOnly.length < 2) {
      return phoneNumber; // Return original number if invalid
    }

    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) '); // Add a space after country code
    int i = 0;

    while (i < digitsOnly.length) {
      int groupLength = 3; // Default for most countries
      if (i == 0 && countryCode != '+1') {
        groupLength = 2; // Special handling for non-US numbers
      }

      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));
      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }
      i = end;
    }

    return formattedNumber.toString(); // Return the formatted string
  }
}
