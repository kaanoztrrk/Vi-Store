class ViFirebaseException implements Exception {
  final String code;

  ViFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurrend. Please try again.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience';
      case 'user-disabled':
        return 'The user accout has been disabled';
      case 'user-not-found':
        return 'No user account has been disabled';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'operation-notallowed':
        return 'This operation is not allowed. Contact support for assistance.';
      case 'invalid-credential':
        return 'The sypplied credential is malformed or has expired.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'captcha-check-failed':
        return 'The reCAPTCHA response is invalid. Please try again.';
      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication with the provided API key.';
      case 'keychain-error':
        return 'A keychain error occurred. Please check the keychain and try again.';
      case 'internal-error':
        return 'An internal authentication error occured. Please try again.';
      case 'invalid-app-credentiial':
        return 'The app credential is invalid. Please provide a valid app credential';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signet in user.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires renect authentication. Please log in again.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'invalid-app-credetial':
        return 'The app credential is invalid. Please provide a valid app credential.';
      case '':
        return '';
      default:
        return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}
