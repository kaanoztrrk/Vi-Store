class ViFormatException implements Exception {
  final String message;

  const ViFormatException(
      [this.message =
          'An unexpected format error occurred. Please check your input.']);
  factory ViFormatException.fromMessage(String message) {
    return ViFormatException(message);
  }

  String get formattedMessage => message;

  factory ViFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const ViFormatException(
            'The email address formatis invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const ViFormatException(
            'The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const ViFormatException(
            'The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const ViFormatException(
            'The URL is invalid. Please a valid URL');
      case 'invalid-credit-ccard-format':
        return const ViFormatException(
            'The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numreic-format':
        return const ViFormatException(
            'The input should be a valid numeric format.');

      default:
        return const ViFormatException(
            'An unexpected Firebase error occurred. Please try again.');
    }
  }
}
