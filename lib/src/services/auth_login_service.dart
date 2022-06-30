import 'dart:developer';
import 'dart:ffi';

import 'package:aplicacao/src/controllers/cadastro_controller.dart';
import 'package:aplicacao/src/exceptions/exceptions.dart';
import 'package:aplicacao/src/services/firestore_database_service.dart';
import 'package:aplicacao/src/util/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxController {
  static AuthService authInstance = Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  late Rx<User?> _user;
  bool _isLoading = false;

  User? get user => _user.value;
  bool get isLoading => _isLoading;

  String getUID() => _auth.currentUser!.uid;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(_auth.currentUser);
    _user.bindStream(_auth.userChanges());

    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      if (_googleSignIn.currentUser != null) {
        FirestoreDatabaseService.instance.getUser(uid: user.uid).then((value) {
          if (value?.id == null) {
            Get.offAllNamed("/termoDeUsoGoogle");
          } else {
            Get.offAllNamed('/home');
          }
        });
      } else {
        FirestoreDatabaseService.instance
            .getQuestionariosPeriodicosByUID(uid: user.uid)
            .then((value) {
          if (value!.isEmpty) {
            Get.toNamed("/questionarioPeriodico");
          } else {
            Get.offAllNamed('/home');
          }
        });
      }
    } else {
      Get.offAllNamed('/signin');
    }
  }

  Future<User?> loginComEmailSenha(
    String email,
    String senha,
  ) async {
    try {
      _isLoading = true;
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: senha);

      return _auth.currentUser ?? userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Nome de usuário não registrado!');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Usuário e/ou senha invalido(s)!');
      }
    }
    return null;
  }

  Future<User?> criarContaUsuario({
    required String nome,
    required String email,
    required String senha,
  }) async {
    try {
      var controller = CadastroController.instance;
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      _user.value = userCredential.user;

      await _user.value!.updateDisplayName(nome);
      await _user.value!.reload();
      _user.value = _auth.currentUser;

      if (_auth.currentUser != null) {
        controller.habilitarBotao = !controller.habilitarBotao;
        controller.saveUser();
        controller.saveQuestionarioLocalDor();
        controller.saveQuestionarioAtividadeFisica();
        controller.saveQuestionarioSintomas();
        controller.limparValoresDoController();
      }

      return _auth.currentUser ?? userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha fornecida é muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('A conta já existe para esse e-mail!');
      }
    } catch (e) {
      throw AuthException('Não foi possível fazer o cadastro!');
    }
    return null;
  }

  Future<User?> loginGooole() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        _isLoading = true;
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        _user.value = userCredential.user;
        return _auth.currentUser ?? userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          throw AuthException(
              'A conta já existe com uma credencial diferente.');
        } else if (e.code == 'invalid-credential') {
          throw AuthException(
              'Ocorreu um erro ao acessar as credenciais. Tente novamente.');
        }
      } catch (e) {
        throw AuthException(
            'Ocorreu um erro ao usar o Login do Google. Tente novamente.');
      }
    }
    return null;
  }

  Future<void> resetPassword({required String email}) {
    return _auth
        .sendPasswordResetEmail(
      email: email,
    )
        .then((value) {
      throw AuthException(
        AuthExceptionHandler.generateErrorMessage(AuthStatus.successful),
      );
    }).catchError((e) {
      log(e);
      throw AuthException(
        AuthExceptionHandler.generateErrorMessage(e),
      );
    });
  }

  Future signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
