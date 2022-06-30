import 'package:firebase_auth/firebase_auth.dart';

class PerfilDados {
  late String nome;
  late String email;
  late String photoUrl;

  PerfilDados({
    required this.nome,
    required this.email,
    required this.photoUrl,
  });

  factory PerfilDados.fromJson(Map<String, dynamic> json) {
    return PerfilDados(
      nome: json['nome'],
      email: json['email'],
      photoUrl: json['photoUrl'],
    );
  }
  factory PerfilDados.fromUser(User user) {
    return PerfilDados(
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
