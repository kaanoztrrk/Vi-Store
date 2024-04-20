class ViPlatformException implements Exception {
  final String code;

  ViPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double-check your information';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method.';
      case 'invalid-password':
        return 'Incorrect password. PLease try again.';
      case 'invalid-phone-number':
        return 'The provided phone number is invalid';
      case 'operation-not-allowed':
        return 'The sign-in provider is disabled for your Firebase project.';
      case 'session-cookiie-expired':
        return 'The Firebase session cookie has expired. Please sign in again.';
      case 'uid-already-exists':
        return 'The provided  user ID is alreadt in use by another user.';
      case 'sing_in_failed':
        return 'Sign-in failed. Please try again.';
      case 'network-request-failed':
        return 'Network request failed. Please check your internet connection';
      case 'internal-error':
        return 'Internal error. Please try again later.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please nter a valid code.';
      default:
        return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}
