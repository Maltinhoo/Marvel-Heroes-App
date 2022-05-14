import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:page_transition/page_transition.dart';

import 'configure.dart';
import 'models/character_model.dart';
import 'modules/character/character_page.dart';
import 'modules/home/home_page.dart';
import 'modules/wrapper/wrapper_page.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await configure();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: WrapperPage(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            // case '/':
            //   return PageTransition(
            //       child: WrapperPage(), type: PageTransitionType.fade);

            case '/home':
              return PageTransition(
                  child: HomePage(), type: PageTransitionType.fade);
            case '/character':
              return PageTransition(
                  child: CharacterPage(
                    characterModel: settings.arguments as CharacterModel,
                  ),
                  type: PageTransitionType.fade);
            default:
              return null;
          }
        },
      );
}
