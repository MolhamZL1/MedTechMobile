import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/custom_bloc_observer.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/auth/presentation/views/sign_in_view.dart';
import 'package:medtech_mobile/core/utils/app_themes.dart';
import 'package:medtech_mobile/core/routing/on_generate_route.dart';
import 'package:medtech_mobile/features/main/presentaion/views/main_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/auth/data/models/user_model.dart';
import 'features/auth/domain/entities/user_entity.dart';
import 'features/auth/domain/repos/auth_repo.dart';
import 'features/auth/presentation/cubits/signin/sign_in_cubit.dart';
import 'features/favorites/domain/repo/favorite_repo.dart';
import 'features/favorites/presentation/cubits/add/addto_favorite_cubit.dart';
import 'features/main/presentaion/cubits/nav_bar/nav_bar_cubit.dart';
import 'features/profile/domain/repo/profile_repo.dart';
import 'features/profile/presentation/cubit/cubit/profile_cubit.dart';
import 'generated/l10n.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
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
        BlocProvider(
          create:
              (_) => ProfileCubit(profileRepo: getIt.get<ProfileRepo>())
                ..fetchProfile(), // 👈 حتى يجيب بيانات البروفايل أول ما يشتغل
        ),
        BlocProvider(create: (_) => NavBarCubit()),
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
  UserEntity? user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString("user");
      if (raw != null && raw.isNotEmpty) {
        user = UserModel.fromJson(jsonDecode(raw)).toEntity();
      } else {
        user = null;
      }
    } catch (e) {
      user = null;
    } finally {
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return (user != null) ? const MainView() : const SignInView();
  }
}
