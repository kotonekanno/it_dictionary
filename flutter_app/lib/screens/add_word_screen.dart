import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/centered_max_width.dart';
import '../utils/add_word_actions.dart';
import '../widgets/word_input_form.dart';

class AddWordScreen extends StatefulWidget {
  const AddWordScreen({super.key});

  @override
  AddWordScreenState createState() => AddWordScreenState();
}

class AddWordScreenState extends State<AddWordScreen> {
  final _mainController = TextEditingController();
  final _subController = TextEditingController();

  final _englishFocus = FocusNode();

  @override
  void dispose() {
    _mainController.dispose();
    _subController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Word'),
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
                    _mainController.text.trim(),
                    _subController.text.trim(),
                    _mainController,
                    _subController,
                    _englishFocus,
                  );
                  return null;
                },
              ),
            },
            child: WordInputForm(
              mainController: _mainController,
              subController: _subController,
              mainFocus: _englishFocus,
              onPressed: () {
                onAddPressed(
                  context,
                  _mainController.text.trim(),
                  _subController.text.trim(),
                  _mainController,
                  _subController,
                  _englishFocus,
                );
              },
            )
          ),
        ),
      ),
    );
  }
}