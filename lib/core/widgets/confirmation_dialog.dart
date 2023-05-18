import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/font_manager.dart';

class ConfirmationDialog extends StatelessWidget {
  final String alertMsg , ok , cancel;
  final VoidCallback onTapConfirm;

  const ConfirmationDialog(
      {Key? key, required this.alertMsg ,required this.ok ,required this.cancel, required this.onTapConfirm})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(

      content: Text(
        alertMsg,
        style: TextStyle(
            fontFamily: FontConstants.defaultFontFamily,
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
     actions: <Widget>[
        TextButton(

            style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: FontConstants.defaultFontFamily,
                    fontSize: 14)),
            onPressed: () => Navigator.of(context).pop(),
           child: Text(
          cancel,
             )),
         TextButton(
           style: TextButton.styleFrom(
               foregroundColor: Colors.black,
               textStyle: const TextStyle(
                   fontWeight: FontWeight.bold,
                   fontFamily: FontConstants.defaultFontFamily,
                   fontSize: 14)),
           onPressed: () => onTapConfirm(),
           child: Text(ok),
         ),
       ],
    );
  }
}
