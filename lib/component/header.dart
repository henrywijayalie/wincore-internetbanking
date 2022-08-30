// ignore_for_file: implementation_imports, must_be_immutable

import 'package:wincoremobile/controllers/MenuController.dart';
import 'package:wincoremobile/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

// import '../../../constants.dart';

class Header extends StatelessWidget {
  Header({
    Key? key,
    required this.username,
    this.pageTitle,
    required this.lastLogin,
  }) : super(key: key);
  String username;
  String? pageTitle;
  String lastLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              onPressed: () {
                context.read<MenuController>().controlMenu();
              },
              icon: const Icon(Icons.menu),
            ),
          Text(
            pageTitle!.toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
          // const Expanded(child: SearchField()),
          // ProfileCard(
          //   username: username,
          //   lastLogin: lastLogin,
          // )
        ],
      ),
    );
  }
}

// class SearchField extends StatelessWidget {
//   const SearchField({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: "Search",
//         fillColor: secondaryColor,
//         filled: true,
//         border: const OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//         ),
//         suffixIcon: InkWell(
//           onTap: () {},
//           child: Container(
//             padding: const EdgeInsets.all(defaultPadding * 0.75),
//             margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
//             decoration: const BoxDecoration(
//               color: primaryColor,
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//             child: SvgPicture.asset("assets/icons/Search.svg"),
//           ),
//         ),
//       ),
//     );
//   }
// }
