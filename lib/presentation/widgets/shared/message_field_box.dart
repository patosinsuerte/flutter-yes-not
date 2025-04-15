import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    // VARIABLES

    final ColorScheme defaultColor = Theme.of(context).colorScheme;
    final TextEditingController textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    // WIDGETS

    final inputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
    );

    final inputDecoration = InputDecoration(
      hintText: "Terminaste con: '?'",
      enabledBorder: inputBorder,
      focusedBorder: inputBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          final inputText = textController.value.text;
          print("flutter button: $inputText");
          textController.clear();
          focusNode.requestFocus();
        },
        icon: Icon(Icons.send_outlined),
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();

        focusNode.requestFocus();
      },
      textInputAction: TextInputAction.newline,
    );
  }
}
