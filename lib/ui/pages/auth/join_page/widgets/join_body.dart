// import 'package:flutter/material.dart';
// import 'package:flutter_blog/_core/constants/move.dart';
// import 'package:flutter_blog/_core/constants/size.dart';
// import 'package:flutter_blog/ui/pages/auth/join_page/widgets/join_form.dart';
// import 'package:flutter_blog/ui/widgets/custom_logo.dart';
// import 'package:flutter_blog/ui/widgets/custom_text_button.dart';
//
// class JoinBody extends StatelessWidget {
//   const JoinBody({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: ListView(
//         children: [
//           const SizedBox(height: xlargeGap),
//           const CustomLogo("Blog"),
//           const SizedBox(height: largeGap),
//           JoinForm(),
//           CustomTextButton(
//             "로그인 페이지로 이동",
//             () {
//               Navigator.pushNamed(context, Move.loginPage);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
