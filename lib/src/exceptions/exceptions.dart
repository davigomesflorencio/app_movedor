import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  userNotFound,
  unknown,
}

class AuthExceptionHandler {
  static handleAuthException(FirebaseAuthException e) {
    AuthStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthStatus.wrongPassword;
        break;
      case "weak-password":
        status = AuthStatus.weakPassword;
        break;
      case "email-already-in-use":
        status = AuthStatus.emailAlreadyExists;
        break;
      case "user-not-found":
        status = AuthStatus.userNotFound;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }

  static String generateErrorMessage(error) {
    String errorMessage;
    switch (error) {
      case AuthStatus.invalidEmail:
        errorMessage = "Seu endereço de e-mail parece estar incorreto";
        break;
      case AuthStatus.weakPassword:
        errorMessage = "Sua senha deve ter pelo menos 6 caracteres.";
        break;
      case AuthStatus.wrongPassword:
        errorMessage = "Seu e-mail ou senha está errado.";
        break;
      case AuthStatus.emailAlreadyExists:
        errorMessage =
            "O endereço de e-mail já está sendo usado por outra conta.";
        break;
      case AuthStatus.userNotFound:
        errorMessage = "Não existe um usuário com este email cadastrado.";
        break;
      case AuthStatus.successful:
        errorMessage = "Foi enviado um email para você recuperar sua senha!";
        break;
      default:
        errorMessage =
            "Um erro ocorreu. Por favor, tente novamente mais tarde.";
    }
    return errorMessage;
  }
}
