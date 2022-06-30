import 'package:aplicacao/src/views/cadastro/cadastro_conta_google_page.dart';
import 'package:aplicacao/src/views/cadastro/cadastro_conta_page.dart';
import 'package:aplicacao/src/views/capitulos/capitulo01/capitulo01.dart';
import 'package:aplicacao/src/views/capitulos/capitulo03/capitulo03.dart';
import 'package:aplicacao/src/views/capitulos/capitulo04/capitulo04.dart';
import 'package:aplicacao/src/views/capitulos/capitulo05/capitulo05.dart';
import 'package:aplicacao/src/views/capitulos/capitulo06/nav_teste_page.dart';
import 'package:aplicacao/src/views/checkin/check_in.binding.dart';
import 'package:aplicacao/src/views/checkin/check_in_page.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/diario/atividade_binding.dart';
import 'package:aplicacao/src/views/diario/criar_atividade/criar_atividade_page.dart';
import 'package:aplicacao/src/views/diario/editar_atividade/editar_atividade_page.dart';
import 'package:aplicacao/src/views/diario/feedback_atividade/feedback_page.dart';
import 'package:aplicacao/src/views/diario/historico_binding.dart';
import 'package:aplicacao/src/views/home/nav_home.dart';
import 'package:aplicacao/src/views/home/nav_home_binding.dart';
import 'package:aplicacao/src/views/login/login_page.dart';
import 'package:aplicacao/src/views/notificacao/notificacao_binding.dart';
import 'package:aplicacao/src/views/notificacao/notificacao_page.dart';
import 'package:aplicacao/src/views/pesquisas/questionario_periodico/questionario_periodico_binding.dart';
import 'package:aplicacao/src/views/pesquisas/questionario_periodico/questionario_periodico_page.dart';
import 'package:aplicacao/src/views/recuperar_senha/recuperar_senha_page.dart';
import 'package:aplicacao/src/views/sobre/sobre_page.dart';
import 'package:aplicacao/src/views/splash/splash_page.dart';
import 'package:aplicacao/src/views/telaPerfil.dart';
import 'package:aplicacao/src/views/termo_de_uso/termo_de_uso.dart';
import 'package:aplicacao/src/views/termo_de_uso/termo_de_uso_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MoveDor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "WorkSans",
        primarySwatch: CoresMovedor.primary,
      ),
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("pt", "BR"),
      ],
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashPage(),
        ),
        GetPage(
          name: '/checkin',
          page: () => const CheckinPage(),
          binding: CheckInBind(),
        ),
        GetPage(
          name: '/signin',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: '/signup',
          page: () => const CadastroContaPage(),
        ),
        GetPage(
          name: '/signupGoogle',
          page: () => const CadastroContaGooglePage(),
        ),
        GetPage(
          name: '/questionarioPeriodico',
          page: () => const QuestionarioPeriodicoPage(),
          binding: QuestionariosPeriodicosBind(),
        ),
        GetPage(
          name: '/home',
          page: () => const NavigationHomePage(),
          binding: NavigationHomeBind(),
        ),
        GetPage(
          name: '/criarAtividade',
          page: () => const CriarAtividadePage(),
          binding: AtividadeBind(),
        ),
        GetPage(
          name: '/editarAtividade',
          page: () => const EditarAtividadePage(),
          binding: AtividadeBind(),
        ),
        GetPage(
          name: '/feedback',
          page: () => FeedbackPage(),
          binding: HistoricoAtividadesBind(),
        ),
        GetPage(
          name: '/notificacao',
          page: () => const NotificacaoPage(),
          binding: NotificacaoBind(),
        ),
        GetPage(
          name: '/termoDeUso',
          page: () => TermoDeUso(),
        ),
        GetPage(
          name: '/termoDeUsoGoogle',
          page: () => TermoDeUsoGoogle(),
        ),
        GetPage(
          name: '/recuperarSenha',
          page: () => RecuperarSenhaPage(),
        )
      ],
      routes: {
        '/capitulo01': (context) => const Capitulo01(),
        '/capitulo03': (context) => const Capitulo03(),
        '/capitulo04': (context) => const Capitulo04(),
        '/capitulo05': (context) => const Capitulo05(),
        '/capitulo06': (context) => const NavegacaoTestStepsPage(),
        '/sobre': (context) => const SobrePage(),
        '/perfil': (context) => const Perfil(),
      },
    );
  }
}
