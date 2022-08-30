// ignore_for_file: non_constant_identifier_names, implementation_imports, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:wincoremobile/component/side_menu.dart';
import 'package:wincoremobile/controllers/MenuController.dart';
import 'package:wincoremobile/responsive.dart';

class FAQ extends StatefulWidget {
  FAQ({
    Key? key,
    required this.username,
    required this.noRek,
    required this.userid,
    required this.custNo,
    required this.lastLogin,
  }) : super(key: key);
  String username;
  String noRek;
  String userid;
  String custNo;
  String lastLogin;
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      appBar: AppBar(
        title: const Text("Pertanyaan dan Dukungan"),
        centerTitle: true,
        backgroundColor: const Color(0xff120A7C),
      ),
      drawer: Responsive.isDesktop(context)
          ? null
          : SideMenu(
              key: context.read<MenuController>().scaffoldKey,
              userid: widget.userid,
              username: widget.username,
              custNo: widget.custNo,
              noRek: widget.noRek,
              lastLogin: widget.lastLogin,
            ),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                // flex: 1, (default)
                child: SideMenu(
                  key: context.read<MenuController>().scaffoldKey,
                  userid: widget.userid,
                  username: widget.username,
                  custNo: widget.custNo,
                  noRek: widget.noRek,
                  lastLogin: widget.lastLogin,
                ),
              ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
