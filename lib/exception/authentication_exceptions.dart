class AuthenticationExceptions {
  final String message;

  const AuthenticationExceptions([this.message = "An unknown error occurred"]);

  factory AuthenticationExceptions.code(String code) {
    switch (code) {
      case 'weak-password':
        return const AuthenticationExceptions("Please enter a stron password");
      case 'invalid-email':
        return const AuthenticationExceptions(
            "Email is not valid or badly formatted");
      case 'email-already-in-use':
        return const AuthenticationExceptions(
            "An account already exists for that email.");
      case 'operation-not-allowed':
        return const AuthenticationExceptions(
            "Operation is not allowed, please contact support");
      case 'user-disabled':
        return const AuthenticationExceptions(
            "This user has been disabled. Please contact support for help");
      default:
        return const AuthenticationExceptions();
    }
  }
}
