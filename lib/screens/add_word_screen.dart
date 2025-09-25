import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/centered_max_width.dart';
import '../utils/word_actions.dart';
import '../widgets/word_input_form.dart';

class AddWordScreen extends StatefulWidget {
  const AddWordScreen({super.key});

  @override
  AddWordScreenState createState() => AddWordScreenState();
}

class AddWordScreenState extends State<AddWordScreen> {
  final _englishController = TextEditingController();
  final _japaneseController = TextEditingController();

  final _englishFocus = FocusNode();

  @override
  void dispose() {
    _englishController.dispose();
    _japaneseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Word'),
        centerTitle: true,
      ),
      body: CenteredMaxWidth(
        maxWidth: 600,
        child: Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              ActivateIntent: CallbackAction<ActivateIntent>(
                onInvoke: (intent) {
                  onAddPressed(
                    context,
                    _englishController.text.trim(),
                    _japaneseController.text.trim(),
                    _englishController,
                    _japaneseController,
                    _englishFocus,
                  );
                  return null;
                },
              ),
            },
            child: WordInputForm(
              englishController: _englishController,
              japaneseController: _japaneseController,
              englishFocus: _englishFocus,
              onAddPressed: () => onAddPressed,
            )
          ),
        ),
      ),
    );
  }
}