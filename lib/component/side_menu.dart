// ignore_for_file: unused_import, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wincoremobile/application/inbox/cubit/trans_inbox_cubit.dart';
import 'package:wincoremobile/constants.dart';
import 'package:wincoremobile/domain/model/transInbox/trans_inbox_request.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/screen/panel/notification/inbox.dart';
import 'package:wincoremobile/screen/panel/settings/faq.dart';
import 'package:wincoremobile/screen/panel/settings/settings.dart';
import 'package:wincoremobile/screen/transactions/qris/qris.dart';

class SideMenu extends StatelessWidget {
  SideMenu({
    Key? key,
    required this.username,
    required this.userid,
  }) : super(key: key);

  String username;
  String userid;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: wincoreColor,
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Image.asset("assets/images/wbk-small1.jpeg"),
            ),
            DrawerListTile(
              title: "Dashboard",
              icon: Icons.home,
              press: () {},
            ),
            BlocProvider(
              create: (context) => TransInboxCubit(),
              child: BlocConsumer<TransInboxCubit, TransInboxState>(
                listener: (context, state) {
                  if (state is TransInboxLoading) {
                    print("Now is loading..");
                  } else if (state is TransInboxError) {
                    print(state.errorMsg);
                  } else if (state is TransInboxSuccess) {
                    if (state.response.status == "OK") {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TransInbox(
                            response: state.response,
                            username: username,
                          ),
                        ),
                      );
                      //print(state.response.toString());
                    } else {
                      AlertMessage(
                          "Informasi",
                          "Mohon coba kembali beberapa saat lagi",
                          "OK",
                          context);
                    }
                  }
                },
                builder: (context, state) {
                  int? messageid = 0;
                  return DrawerListTile(
                    title: "Inbox",
                    icon: null,
                    faIcons: FontAwesomeIcons.envelope,
                    press: () => {
                      context.read<TransInboxCubit>().getTransInbox(
                            TransInboxRequest(
                              username: userid,
                              msgid: int?.tryParse(messageid.toString()),
                            ),
                          ),
                    },
                  );
                },
              ),
            ),
            DrawerListTile(
              title: "FAQ",
              icon: null,
              faIcons: FontAwesomeIcons.clipboardQuestion,
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FAQ(),
                  ),
                );
              },
            ),
            DrawerListTile(
              title: "Settings",
              icon: Icons.settings,
              press: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => Settings(
                //       noRek: widget.no_rek,
                //       username: widget.username,
                //       userid: widget.userid,
                //       cust_no: widget.cust_no,
                //       last_login: widget.lastLogin,
                //     ),
                //   ),
                // );
              },
            ),
            DrawerListTile(
              title: "Logout",
              icon: Icons.exit_to_app_sharp,
              press: () {
                showLogoutAlertDialog(context);
              },
            ),
            // DrawerListTile(
            //   title: "Profile",
            //   icon: null,
            //   press: () {},
            // ),
            // DrawerListTile(
            //   title: "Settings",
            //   icon: null,
            //   press: () {},
            // ),
          ],
        ),
      ),
    );
  }
}

showLogoutAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = ElevatedButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = ElevatedButton(
    child: const Text("Logout"),
    onPressed: () {
      SystemNavigator.pop();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // title: none,
    content: const Text("Anda akan logout dari WINCore Mobile"),
    actions: [
      cancelButton,
      continueButton,
    ],
    actionsAlignment: MainAxisAlignment.end,
    actionsPadding: const EdgeInsets.symmetric(horizontal: 18),
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    this.icon,
    this.faIcons,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final IconData? faIcons;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      hoverColor: Colors.black45,
      leading: icon != null
          ? Icon(
              icon,
              color: Colors.white54,
            )
          : FaIcon(
              faIcons,
              color: Colors.white54,
            ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
