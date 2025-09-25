import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/word_provider.dart';
import 'providers/setting_provider.dart';
import 'ui/header.dart';
import 'ui/footer.dart';
import '../screens/home_screen.dart';
import '../screens/add_word_screen.dart';
import '../screens/setting_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WordProvider()),
        ChangeNotifierProvider(create: (_) => SettingProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Dictionary',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.indigo,
              elevation: 5,
            ),
          ),
        ),
        home: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidget();
}

class _MyStatefulWidget extends State<MyStatefulWidget>{
  final List<Widget> _screens = [
    HomeScreen(),
    AddWordScreen(),
    SettingScreen(),
  ];

  int _selectionIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectionIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectionIndex],
      appBar: Header(),
      bottomNavigationBar: Footer(
        currentIndex: _selectionIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
