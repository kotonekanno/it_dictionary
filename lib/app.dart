import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/word_provider.dart';
import 'providers/setting_provider.dart';
import 'widgets/header.dart';
import 'widgets/footer.dart';
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
        home: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidget();
  //State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidget extends State<MyStatefulWidget>{
  final List<Widget> _screens = [
//class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  //final List<Widget> _screens = const [
    HomeScreen(),
    AddWordScreen(),
    SettingScreen(),
  ];

  int _selectionIndex = 0;
  /*
  @override
  void initState() {
    super.initState();
    _loadDefaultWords();
  }

  Future<void> _loadDefaultWords() async {
    final wordProvider = context.read<WordProvider>();
    await wordProvider.loadDefaultWords();
  }*/

  void _onItemTapped(int index) {
    setState(() {
      _selectionIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectionIndex],
      appBar: const Header(),
      bottomNavigationBar: Footer(
        currentIndex: _selectionIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
