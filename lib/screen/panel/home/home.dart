// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, sized_box_for_whitespace, non_constant_identifier_names, unnecessary_new, prefer_const_constructors, unused_import, implementation_imports, override_on_non_overriding_member

// import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';
import 'package:wincoremobile/component/header.dart';
import 'package:wincoremobile/component/side_menu.dart';
import 'package:wincoremobile/constants.dart';
import 'package:wincoremobile/controllers/MenuController.dart';
import 'package:wincoremobile/helper/modal.dart';
import 'package:wincoremobile/responsive.dart';
import 'package:wincoremobile/screen/panel/account/account_activities/account_activities.dart';
import 'package:wincoremobile/screen/panel/contact_us/contact_us.dart';
import 'package:wincoremobile/screen/panel/notification/notifications.dart';
import 'package:wincoremobile/screen/panel/settings/about.dart';
import 'package:wincoremobile/screen/panel/settings/faq.dart';
import 'package:wincoremobile/screen/panel/settings/settings.dart';
import 'package:wincoremobile/screen/transactions/pindah_buku/transfer_balance2.dart';
import 'package:wincoremobile/screen/transactions/qris/qris.dart';

class Home extends StatefulWidget {
  Home({
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
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String _formatDateTime2() {
    var tempLastLogin = widget.lastLogin.split(".");
    DateTime lastLogin = new DateFormat("yyyy-MM-dd HH:mm:ss")
        .parse(tempLastLogin[0].toString());
    return DateFormat('dd MMM yyyy - hh:mm:ss').format(lastLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xff120A7C),
        title: const Text(
          'WINCore iBanking',
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Row(
            children: [
              ProfileCard(
                username: widget.username,
                lastLogin: _formatDateTime2(),
              )
            ],
          ),
        ],
      ),
      drawer: Responsive.isDesktop(context)
          ? null
          : SideMenu(
              key: context.read<MenuController>().scaffoldKey,
              userid: widget.userid,
              username: widget.username,
              custNo: widget.custNo,
              noRek: widget.noRek,
              lastLogin: _formatDateTime2(),
            ),
      body: SafeArea(
        child: Center(
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
                    lastLogin: _formatDateTime2(),
                  ),
                ),
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ImageSlider(),
                      MainMenu(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding MainMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Wrap(
        // crossAxisAlignment: WrapCrossAlignment.start,
        // alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: Responsive.isDesktop(context) ? 150 : 125,
              height: Responsive.isDesktop(context) ? 150 : 125,
              child: Card(
                elevation: 0.2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: InkWell(
                  onTap: () {
                    M_PIN_AccInfoModalDialog(
                        context, widget.username, widget.userid, widget.noRek);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/icons-new/menuicon_info_rekening.png',
                        width: 45,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Informasi Rekening",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 10,
                            color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: Responsive.isDesktop(context) ? 150 : 125,
              height: Responsive.isDesktop(context) ? 150 : 125,
              child: Card(
                elevation: 0.2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AccountActivities(
                          username: widget.username,
                          userid: widget.userid,
                          noRek: widget.noRek,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/icons-new/menuicon_mutasi_rekening.png',
                        width: 45,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Mutasi Rekening",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 10,
                            color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: Responsive.isDesktop(context) ? 150 : 125,
              height: Responsive.isDesktop(context) ? 150 : 125,
              child: Card(
                elevation: 0.2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: InkWell(
                  onTap: () {
                    M_PIN_DepositoModalDialog(context, widget.username,
                        widget.userid, widget.noRek, widget.custNo, "1");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/icons-new/menuicon_info_deposito.png',
                        width: 45,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Informasi Deposito",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 10,
                            color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: Responsive.isDesktop(context) ? 150 : 125,
              height: Responsive.isDesktop(context) ? 150 : 125,
              child: Card(
                elevation: 0.2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TransferBalance2(
                          noRek: widget.noRek,
                          username: widget.username,
                          userid: widget.userid,
                          custNo: widget.custNo,
                          lastLogin: widget.lastLogin,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/icons-new/menuicon_transfer.png',
                        width: 45,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Transfer Saldo (PB)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 10,
                            color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     width: Responsive.isDesktop(context)? 150 : 125,
          //     height: Responsive.isDesktop(context)? 150 : 125,
          //     child: Card(
          //       elevation: 0.2,
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(8.0)),
          //       child: InkWell(
          //         onTap: () {
          //           // Navigator.of(context).push(MaterialPageRoute(
          //           //     builder: (context) =>
          //           //         const TransferBalance()));
          //         },
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment:
          //               CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Image.asset(
          //               'assets/images/icons-new/menuicon_multi_transfer.png',
          //               width: 45,
          //             ),
          //             const SizedBox(height: 8),
          //             const Text(
          //               "Multi Transfer",
          //               textAlign: TextAlign.center,
          //               style: TextStyle(fontFamily:"Montserrat",
          //                   fontSize: 10,
          //                   color: Colors.black87),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: Responsive.isDesktop(context) ? 150 : 125,
              height: Responsive.isDesktop(context) ? 150 : 125,
              child: Card(
                elevation: 0.2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: InkWell(
                  onTap: () {
                    M_PIN_PortfolioModalDialog(context, widget.username,
                        widget.userid, widget.noRek, widget.custNo, "1");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/icons-new/menuicon_portfolio.png',
                        width: 45,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Portfolio",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 10,
                            color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: Responsive.isDesktop(context) ? 150 : 125,
              height: Responsive.isDesktop(context) ? 150 : 125,
              child: Card(
                elevation: 0.2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: InkWell(
                  onTap: () {
                    M_PIN_PinjamanModalDialog(context, widget.username,
                        widget.userid, widget.noRek, widget.custNo, "1");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/icons-new/menuicon_pinjaman.png',
                        width: 45,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Pinjaman",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 10,
                            color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     width: Responsive.isDesktop(context)? 150 : 125,
          //     height: Responsive.isDesktop(context)? 150 : 125,
          //     child: Card(
          //       elevation: 0.2,
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(8.0)),
          //       child: InkWell(
          //         onTap: () {
          //           modalBottomSheetPembayaran(context);
          //         },
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment:
          //               CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Image.asset(
          //               'assets/images/icons-new/menuicon_pembayaran.png',
          //               width: 45,
          //             ),
          //             const SizedBox(height: 8),
          //             const Text(
          //               "Pembayaran",
          //               textAlign: TextAlign.center,
          //               style: TextStyle(fontFamily:"Montserrat",
          //                   fontSize: 10,
          //                   color: Colors.black87),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: Responsive.isDesktop(context) ? 150 : 125,
              height: Responsive.isDesktop(context) ? 150 : 125,
              child: Card(
                elevation: 0.2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ContactUs(
                          key: context.read<MenuController>().scaffoldKey,
                          username: widget.username,
                          userid: widget.userid,
                          custNo: widget.custNo,
                          noRek: widget.noRek,
                          lastLogin: _formatDateTime2(),
                        ),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/icons-new/menuicon_ask.png',
                        width: 45,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Ask Bank Demo",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 10,
                            color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
}

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
        aspectRatio: Responsive.isDesktop(context) ? 5 : 3,
      ),
      items: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Image.asset(
                'assets/images/WINCore.jpeg',
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Image.asset(
                'assets/images/wincore_cooperation.png',
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Image.asset(
                'assets/images/wincore_microbanking.png',
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Image.asset(
                'assets/images/wincore_syariah.png',
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Image.asset(
                'assets/images/product_mcore.png',
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ],
          ),
        ),
      ],
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
        // border: Border.all(color: Colors.white10),
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
              child: Text("Login terakhir : " + lastLogin),
            ),
          // const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
