import 'dart:ui';

import 'package:aplicacao/src/controllers/cadastro_controller.dart';
import 'package:aplicacao/src/models/dados_pessoais.dart';
import 'package:aplicacao/src/models/perfil_drawer.dart';
import 'package:aplicacao/src/models/usuario.dart';
import 'package:aplicacao/src/models/usuario_drawer.dart';
import 'package:aplicacao/src/services/auth_login_service.dart';
import 'package:aplicacao/src/services/firestore_database_service.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/custom_buttom.dart';
import 'package:aplicacao/src/views/components/input_text.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:aplicacao/src/views/termo_de_uso/termo_de_uso.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);
  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  PerfilDados? perfilDados;
  Usuario? usuario;
  DadosPessoais? dadosPessoais;

  String? cidade;
  String? data;
  String? altura;
  String? peso;
  String? estudo;
  void initState() {
    super.initState();
    String? url = AuthService.authInstance.user!.photoURL;
    String? displayName = AuthService.authInstance.user!.displayName;
    String? email = AuthService.authInstance.user!.email;

    FirestoreDatabaseService.instance.getUser(uid: AuthService.authInstance.getUID()).then((value){
      usuario = value;
      dadosPessoais = value!.dadosPessoais;

      setState(() {
        cidade = dadosPessoais!.cidade;
        data = dadosPessoais!.dataNascimento;
        peso = dadosPessoais!.peso.toString();
        altura = dadosPessoais!.altura.toString();
        estudo = dadosPessoais!.tempoEstudo.toString();
      });
    });
    
    perfilDados = PerfilDados(
      nome: displayName ?? '',
      email: email!,
      photoUrl: url ?? '',
    );
  }

  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meu perfil",
          style: TextStyleMovedor.appBar,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 75.0,left: 70.0,right: 70.0),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20),
              child: Column(
                children: [     
                  perfilDados!.photoUrl == '' 
                    ?CircleAvatar(
                      radius: 90.0,
                      backgroundImage: AssetImage('assets/images/no_profile.png',),
                      backgroundColor: Colors.white
                    )
                    :CircleAvatar(
                      radius: 90.0,
                      backgroundImage: NetworkImage(perfilDados!.photoUrl,),
                      backgroundColor: Colors.white
                    ),
                  
                  SizedBox(height: 15.0),
                  Text(perfilDados!.nome,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CoresMovedor.textoPadrao,
                    fontSize: 20,
                  ),),
                ],
              ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Email : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(perfilDados!.email,          
                          style: TextStyle(
                            fontSize: 17,)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Data : ',        
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(data.toString(),          
                          style: TextStyle(
                            fontSize: 17,)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Cidade : ',            
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(cidade.toString(),          
                          style: TextStyle(
                            fontSize: 17,)
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Anos de estudo : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(estudo.toString(),          
                          style: TextStyle(
                            fontSize: 17,)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Peso : ',             
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(peso.toString(),          
                          style: TextStyle(
                            fontSize: 17,)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Altura : ',             
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(altura.toString(),          
                          style: TextStyle(
                            fontSize: 17,)),
                      ],
                    ),
              ],
            ),
            SizedBox(
              height: 50,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.20,vertical: size.height * 0.025),
                onPrimary: CoresMovedor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                )
              ),
              onPressed: () =>
                 Navigator.of(context).pushReplacementNamed('/editarPerfil'), 
              child:Text(
                'Editar perfil',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              )         
            ),
          ],
        ),
      ),
    );
  }
}