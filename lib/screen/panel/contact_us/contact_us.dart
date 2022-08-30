// ignore_for_file: prefer_const_constructors, unnecessary_new, must_be_immutable, implementation_imports

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wincoremobile/component/side_menu.dart';
import 'package:wincoremobile/controllers/MenuController.dart';
import 'package:wincoremobile/responsive.dart';

class ContactUs extends StatefulWidget {
  ContactUs({
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
  State<ContactUs> createState() => _ContactUsStateState();
}

class _ContactUsStateState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    const number = '+6281299198070';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff120A7C),
        title: const Text('Tanya Bank Demo'),
        centerTitle: true,
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
                    children: [
                      Card(
                        elevation: 4,
                        margin:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: const FaIcon(
                                FontAwesomeIcons.envelopesBulk,
                                color: Colors.black,
                              ),
                              title: const Text("Email"),
                              trailing: const Icon(Icons.keyboard_arrow_right),
                              onTap: () async {
                                sendEmail();
                              },
                            ),
                            _buildDivider(),
                            ListTile(
                              leading: const FaIcon(
                                FontAwesomeIcons.phone,
                                color: Colors.black,
                              ),
                              title: const Text("Call Center"),
                              trailing: const Icon(Icons.keyboard_arrow_right),
                              onTap: () async {
                                //indirext phone
                                launch('tel://$number');
                              },
                            ),
                            _buildDivider(),
                            ListTile(
                              leading: const FaIcon(
                                FontAwesomeIcons.commentSms,
                                color: Colors.black,
                              ),
                              title: const Text("SMS"),
                              trailing: const Icon(Icons.keyboard_arrow_right),
                              onTap: () async {
                                //open change location
                                launch('sms://$number');
                              },
                            ),
                            _buildDivider(),
                            ListTile(
                              leading: const FaIcon(
                                FontAwesomeIcons.whatsapp,
                                color: Colors.black,
                              ),
                              title: const Text("WhatsApp"),
                              trailing: const Icon(Icons.keyboard_arrow_right),
                              onTap: () async {
                                openwhatsapp();
                              },
                            ),
                            _buildDivider(),
                            ListTile(
                              leading: const FaIcon(
                                FontAwesomeIcons.earthAsia,
                                color: Colors.black,
                              ),
                              title: const Text("Website Bank Demo"),
                              trailing: const Icon(Icons.keyboard_arrow_right),
                              onTap: () async {
                                var url = "http://www.wbk.co.id/";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: new Text("Can't Load url")));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      width: double.infinity,
      height: 1,
      color: Colors.grey.shade400,
    );
  }

  sendEmail() async {
    var toEmail = "wbksupport@warna-bintang.co.id";
    var subject = "WINCore Mobile Help Support #" + widget.noRek;
    var email = "mailto:$toEmail?subject=${Uri.encodeFull(subject)}";
    if (await canLaunch(email)) {
      await launch(email);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: new Text("No Email Apps Installed")));
    }
  }

  openwhatsapp() async {
    var whatsapp = "+6281299198070";
    var whatsappURlAndroid =
        "whatsapp://send?phone=" + whatsapp + "&text=Halo WBK";
    var whatappURLIos = "https://wa.me/$whatsapp?text=${Uri.parse("Halo WBK")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURLIos)) {
        await launch(whatappURLIos, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("WhatsApp no installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURlAndroid)) {
        await launch(whatsappURlAndroid);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("WhatsApp no installed")));
      }
    }
  }
}
