// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:my_secret/widgets/my_appbar.dart';
// import 'package:my_secret/widgets/my_text.dart';
// import 'package:my_secret/widgets/my_text_form_field.dart';
//
// class FilesContentView extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _FilesContentView();
// }
//
// class _FilesContentView extends State<FilesContentView> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController textEditingControllerDummy =
//         new TextEditingController();
//     return SafeArea(
//         child: Scaffold(
//       appBar: _myAppBar(),
//       body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Expanded(
//                 child: MyTextFormField(
//                   initialValue:
//                       "aaaaadadwdawfwaaaaaaaafwafawwwwwwwwwwwwwwwwafwafaffffffffffafwfwafwwwwwwwwwwwwwwwfadwadwadadawdwadwa",
//                   textInputAction: TextInputAction.none,
//                   hint: "",
//                   textEditingController: textEditingControllerDummy,
//                   icon: Icon(
//                     Icons.manage_accounts_outlined,
//                   ),
//                   obscureText: false,
//                   textInputType: TextInputType.text,
//                   // maxLines: MediaQuery.of(context).size.height.toInt(),
//                 ),
//               )
//             ],
//           )),
//     ));
//   }
//
//   AppBar _myAppBar() {
//     return MyAppBar(
//       title: MyText(
//         text: "Crot",
//         textColor: Colors.white,
//         overflow: TextOverflow.visible,
//         fontWeight: FontWeight.w700,
//         fontSize: 20,
//       ),
//       centerTitle: true,
//       automaticallyImplyLeading: true,
//       actions: [],
//       backgroundColor: Colors.transparent,
//     );
//   }
// }
