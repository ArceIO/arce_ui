import 'package:arce_ui/arce_ui.dart';
import 'package:flutter/material.dart';

class TextModel {
  String? text;
}

class AuInputTextExample extends StatefulWidget {
  AuInputTextExample();

  @override
  State<StatefulWidget> createState() {
    return _AuInputTextExampleState();
  }
}

class _AuInputTextExampleState extends State<AuInputTextExample> {
  TextModel model = TextModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AuAppBar(
          title: 'input动态算高',
        ),
        body: Container(
          color: Colors.white,
          child: Column(children: [
            _inputText(),
            SizedBox(
              height: 20,
            ),
          ]),
        ));
  }

  Widget _inputText() {
    return AuInputText(
      maxHeight: 200,
      minHeight: 30,
      minLines: 1,
      maxLength: 10,
      bgColor: Colors.grey[200]!,
      textString: model.text ?? '',
      textInputAction: TextInputAction.newline,
      maxHintLines: 20,
      hint: 'input动态算高input动态算高input动态算高input动态算高input动态算高',
      padding: EdgeInsets.fromLTRB(20, 10, 20, 14),
      onTextChange: (text) {
        print(text);
        model.text = text;
        setState(() {});
      },
      onSubmit: (text) {
        print(text);
      },
    );
  }
}
