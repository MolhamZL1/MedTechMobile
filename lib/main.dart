import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/custom_bloc_observer.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/auth/presentation/views/forget_password_view.dart';
import 'package:medtech_mobile/features/auth/presentation/views/resetpassword.dart';
import 'package:medtech_mobile/features/auth/presentation/views/sign_in_view.dart';
import 'package:medtech_mobile/core/utils/app_themes.dart';
import 'package:medtech_mobile/core/routing/on_generate_route.dart';
import 'package:medtech_mobile/features/auth/presentation/views/verify_email_view.dart';
import 'package:medtech_mobile/features/main/presentaion/views/main_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medtech_mobile/features/order/presentation/views/widgets/order_view_body.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/product_details_view.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/addtocardsection/addtocard.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/detaile_type_view/detals_type_list.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/detaile_type_view/dettailes_type.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/totuialssection.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/editprofile.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/payment/paymentpage.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/setting/safety&privacy/safetypage.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/setting/settings/mainsettingpage.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/paymentcard.dart';
import 'features/auth/domain/repos/auth_repo.dart';
import 'features/auth/presentation/cubits/signin/sign_in_cubit.dart';
import 'generated/l10n.dart';

void main() {
  Bloc.observer = CustomBlocObserver();
  setupSingltonGetIt();
  runApp(const MedTech());
}

class MedTech extends StatelessWidget {
  const MedTech({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
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
        initialRoute: MainView.routeName,

        //      initialRoute: 'editprofile',
        //      routes: {
        //   'editprofile': (context) => Safetypage(),
        // },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
