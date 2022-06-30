import 'package:firebase_auth/firebase_auth.dart';

class UsuarioDrawer {
  late String nome;
  late String email;
  late String photoUrl;

  UsuarioDrawer({
    required this.nome,
    required this.email,
    required this.photoUrl,
  });

  factory UsuarioDrawer.fromJson(Map<String, dynamic> json) {
    return UsuarioDrawer(
      nome: json['nome'],
      email: json['email'],
      photoUrl: json['photoUrl'],
    );
  }
  factory UsuarioDrawer.fromUser(User user) {
    return UsuarioDrawer(
      nome: user.displayName.toString(),
      email: user.email.toString(),
      photoUrl: user.photoURL.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    return data;
  }
}
