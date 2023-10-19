import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_of_week/Futurebuilder_widget.dart';
import 'package:widget_of_week/Reorderable_list_view.dart';
import 'package:widget_of_week/animated_container.dart';
import 'package:widget_of_week/country_code_pick.dart';
import 'package:widget_of_week/date_and_time.dart';
import 'package:widget_of_week/home_screen.dart';
import 'package:widget_of_week/image_compress.dart';
import 'package:widget_of_week/interactive_viewer_widget.dart';
import 'package:widget_of_week/stream_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'controller/language_change_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  final String languageCode = sp.getString('language_code') ?? '';
  runApp( MyApp(locale: languageCode,));
}

class MyApp extends StatelessWidget {
  String locale;
  MyApp({super.key, required this.locale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
     ChangeNotifierProvider(
         create: (_) => LanguageChangeController(),
     ),
        ],
  child: Consumer<LanguageChangeController>(
      builder: (context, provider, child){
        if(locale.isEmpty){
          provider.changeLanguage(Locale('en'));
        }
        return MaterialApp(
          title: 'Flutter Demo',
          locale: locale == '' ? Locale('en') : provider.appLocale == null ?  Locale('en') : provider.appLocale,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'),
            Locale('es'),
          ],
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:  InteractiveViewerWidget(),
        );
      },
  ),
    );
  }
}

