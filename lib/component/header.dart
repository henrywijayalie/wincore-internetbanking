// ignore_for_file: implementation_imports, must_be_immutable

import 'package:wincoremobile/controllers/MenuController.dart';
import 'package:wincoremobile/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../../constants.dart';

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
          ProfileCard(
            username: username,
            lastLogin: lastLogin,
          )
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  ProfileCard({
    Key? key,
    required this.username,
    required this.lastLogin,
  }) : super(key: key);
  String username;
  String lastLogin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        // color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          // Image.asset(
          //   "assets/images/profile_pic.png",
          //   height: 38,
          // // ),
          const Icon(Icons.person_rounded),
          // if (!Responsive.isMobile(context))
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text(username),
          ),
          if (Responsive.isDesktop(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Login Terakhir : " + lastLogin),
            ),
          // const Icon(Icons.keyboard_arrow_down),
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
