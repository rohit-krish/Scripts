RED='\e[0;1;31m'
NC='\e[0m' # No Color
YELLOW='\e[0;1;33m'
LIGTHGREEN='\e[0;1;92m'
LIGHTBLUE='\e[0;1;94m'

echo "${LIGHTBLUE}"

if [ "$1" != "" ]; then
    flutter create $1

    echo "${YELLOW}Initial flutter setup ready!${NC}"

    rm "$1/lib/main.dart"
    mkdir "$1/lib/pages"
    mkdir "$1/lib/theme"
    mkdir "$1/lib/utils"
    mkdir "$1/lib/widgets"

    # HOME_PAGE DONE
    echo "import 'package:flutter/material.dart';\n\nclass HomePage extends StatelessWidget {\n  const HomePage({Key? key}) : super(key: key);\n\n  @override\n  Widget build(BuildContext context) {\n    return Scaffold();\n  }\n}" > "$1/lib/pages/home_page.dart"

    # THEME DONE
    echo "import 'package:flutter/material.dart';\nimport 'package:flutter/services.dart';\n\nclass MyThemes {\n  static final darkTheme = ThemeData(\n    brightness: Brightness.dark,\n    primarySwatch: Colors.indigo,\n    scaffoldBackgroundColor: Colors.grey.shade900,\n    appBarTheme: AppBarTheme(\n      elevation: 0,\n      centerTitle: true,\n      foregroundColor: Colors.white,\n      backgroundColor: Colors.grey.shade900,\n      systemOverlayStyle: SystemUiOverlayStyle(\n        statusBarColor: Colors.grey.shade900,\n        statusBarIconBrightness: Brightness.light,\n      ),\n    ),\n  );\n  static final lightTheme = ThemeData(\n    brightness: Brightness.light,\n    primarySwatch: Colors.indigo,\n    scaffoldBackgroundColor: Colors.grey.shade100,\n    appBarTheme: AppBarTheme(\n      elevation: 0,\n      centerTitle: true,\n      foregroundColor: Colors.black,\n      backgroundColor: Colors.grey.shade100,\n      systemOverlayStyle: SystemUiOverlayStyle(\n        statusBarColor: Colors.grey.shade100,\n        statusBarIconBrightness: Brightness.dark,\n      ),\n    ),\n  );\n}"  > "$1/lib/theme/theme.dart"

    # MAIN DONE
    echo "import 'package:flutter/material.dart';\nimport 'package:flutter/services.dart';\nimport 'package:$1/theme/theme.dart';\nimport 'package:$1/pages/home_page.dart';\n\n\nmain() {\n  WidgetsFlutterBinding.ensureInitialized();\n  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);\n  return runApp(const App());\n}\n\nclass App extends StatelessWidget {\n  const App({Key? key}) : super(key: key);\n\n  @override\n  Widget build(BuildContext context) {\n    return MaterialApp(\n      debugShowCheckedModeBanner: false,\n      theme: MyThemes.lightTheme,\n      darkTheme: MyThemes.darkTheme,\n      home: HomePage(),\n    );\n  }\n}" > "$1/lib/main.dart"

    echo "${LIGTHGREEN}DONE!${NC}"
else
    echo "${RED}\nProvide the application name!${NC}"
fi
