// ignore_for_file: must_be_immutable, implementation_imports, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';
import 'package:wincoremobile/component/side_menu.dart';
import 'package:wincoremobile/controllers/MenuController.dart';
import 'package:wincoremobile/domain/model/transInbox/trans_inbox_response.dart';
import 'package:wincoremobile/responsive.dart';

class TransInbox extends StatefulWidget {
  TransInbox({
    Key? key,
    required this.response,
    required this.username,
    required this.userid,
    required this.noRek,
    required this.custNo,
    required this.lastLogin,
  }) : super(key: key);
  TransInboxResponse response;
  String username;
  String userid;
  String lastLogin;
  String noRek;
  String custNo;
  @override
  State<TransInbox> createState() => _TransInboxState();
}

class _TransInboxState extends State<TransInbox> {
  var formattedDate = DateFormat('yyyy-MM-dd – HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    var response = widget.response;
    var dataInbox = response.info;

    const _locale = 'en';
    String _formatNumber(String s) =>
        NumberFormat.decimalPattern(_locale).format(int.parse(s));

    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xff120A7C),
        title: const Text(
          'Inbox',
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Responsive.isDesktop(context)
          ? null
          : SideMenu(
              userid: widget.userid,
              username: widget.username,
              lastLogin: widget.lastLogin,
              custNo: widget.custNo,
              noRek: widget.noRek,
            ),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                // flex: 1, (default)
                child: SideMenu(
                  userid: widget.userid,
                  username: widget.username,
                  lastLogin: widget.lastLogin,
                  custNo: widget.custNo,
                  noRek: widget.noRek,
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
                    for (int x = 0; x < dataInbox!.length; x++)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Responsive.isDesktop(context) ? 18 : 27,
                        ),
                        child:
                            inboxTransBtn(context, dataInbox, x, _formatNumber),
                      ),
                  ],
                ),
              ),
            ),
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   decoration: const BoxDecoration(
            //     color: Color(0xfff2f2f4),
            //   ),
            //   child: SingleChildScrollView(
            //     child: Padding(
            //       padding: const EdgeInsets.all(18),
            //       child: Column(
            //         children: [
            //           for (int x = 0; x < dataInbox!.length; x++)
            //             inboxTransBtn(context, dataInbox, x, _formatNumber),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Padding inboxTransBtn(BuildContext context, List<Info> dataInbox, int x,
      String Function(String s) _formatNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xff120A7C)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: () async {
          return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  "Informasi Transaksi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF120A7C),
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Waktu Transaksi : ",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            color: Color(0xFF120A7C),
                          ),
                        ),
                        Text(
                          formattedDate.format(DateTime.parse(
                            dataInbox[x].timestamp.toString(),
                          )),
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF120A7C),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "No Rekening Pengirim : ",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            color: Color(0xFF120A7C),
                          ),
                        ),
                        Text(
                          dataInbox[x].trData!.srcAccount.toString(),
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF120A7C),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Nama Pengirim : ",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            color: Color(0xFF120A7C),
                          ),
                        ),
                        Text(
                          widget.username.toString(),
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF120A7C),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "No Rekening Penerima : ",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            color: Color(0xFF120A7C),
                          ),
                        ),
                        Text(
                          dataInbox[x].trData!.dstAccount.toString(),
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF120A7C),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Nama Penerima : ",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            color: Color(0xFF120A7C),
                          ),
                        ),
                        Text(
                          dataInbox[x].trData!.name.toString(),
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF120A7C),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Nilai Transaksi : ",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            color: Color(0xFF120A7C),
                          ),
                        ),
                        Text(
                          "Rp " +
                              _formatNumber(int.parse(
                                      dataInbox[x].trData!.amount.toString())
                                  .toString()
                                  .replaceAll(',', '')),
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF120A7C),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "No Referensi : ",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            color: Color(0xFF120A7C),
                          ),
                        ),
                        Text(
                          dataInbox[x].traceno.toString(),
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF120A7C),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    dataInbox[x].endpoint.toString(),
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    " - ",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    formattedDate.format(
                        DateTime.parse(dataInbox[x].timestamp.toString())),
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                "Keterangan : " + dataInbox[x].trData!.description.toString(),
                style: const TextStyle(
                  fontFamily: "Montserrat",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
