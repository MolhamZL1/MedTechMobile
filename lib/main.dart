import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medtech_mobile/core/services/custom_bloc_observer.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';

import 'package:medtech_mobile/features/auth/presentation/views/sign_in_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/routing/on_generate_route.dart';
import 'core/utils/App_themes.dart';
import 'features/auth/domain/repos/auth_repo.dart';
import 'features/auth/presentation/cubits/signin/sign_in_cubit.dart';
import 'features/favorites/domain/repo/favorite_repo.dart';
import 'features/favorites/presentation/cubits/add/addto_favorite_cubit.dart';
import 'features/main/presentaion/views/main_view.dart';
import 'generated/l10n.dart';

void main() async {
  Bloc.observer = CustomBlocObserver();
  setupSingltonGetIt();
  runApp(const MedTech());
}

class MedTech extends StatelessWidget {
  const MedTech({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignInCubit(getIt.get<AuthRepo>())),
        BlocProvider(
          create: (_) => AddtoFavoriteCubit(getIt.get<FavoriteRepo>()),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        onGenerateRoute: (settings) => onGenerateRoute(settings),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale("en"),
        initialRoute: StartScreen.routeName,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});
  static const routeName = "/start-screen";

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  String? token;
  @override
  void initState() {
    getToken();
    super.initState();
  }

  getToken() async {
    final prfs = await SharedPreferences.getInstance();
    token = prfs.getString("token");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (token != null) ? const MainView() : const SignInView();
  }
}
