// ignore_for_file: must_be_immutable, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wincoremobile/application/transactions/pindahbuku/cubit/destination_account_cubit.dart';
import 'package:wincoremobile/component/side_menu.dart';
import 'package:wincoremobile/controllers/MenuController.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/dstAccount_request.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/responsive.dart';
import 'package:wincoremobile/screen/auth/change_mpin/change_mpin.dart';
import 'package:wincoremobile/screen/auth/change_password/change_password.dart';
import 'package:wincoremobile/screen/auth/forgot_mpin/forgot_mpin.dart';
// import 'package:wincoremobile/helper/icon_with_label.dart';
import 'package:wincoremobile/screen/panel/settings/administration/delete_dst_account.dart';

class Settings extends StatefulWidget {
  Settings({
    Key? key,
    required this.noRek,
    required this.username,
    required this.userid,
    required this.custNo,
    required this.lastLogin,
  }) : super(key: key);

  String noRek;
  String username;
  String userid;
  String custNo;
  String lastLogin;
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Pengaturan",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff120A7C),
        centerTitle: true,
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
      resizeToAvoidBottomInset: false,
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
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.1,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
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
                                    builder: (context) => ChangePassword(
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
                                    'assets/images/icons-new/icon_password.png',
                                    width: 45,
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "Ubah Kata Sandi",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 10,
                                      color: Colors.black87,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
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
                                    builder: (context) => ChangeMPIN(
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
                                    'assets/images/icons-new/icon_change_m-pin.png',
                                    width: 45,
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "Ubah M-PIN",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 10,
                                      color: Colors.black87,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
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
                                    builder: (context) => ForgotMPin(
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
                                    'assets/images/icons-new/icon_m-pin.png',
                                    width: 45,
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "Lupa M-PIN",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 10,
                                      color: Colors.black87,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      BlocProvider(
                        create: (context) => DestinationAccountCubit(),
                        child: BlocConsumer<DestinationAccountCubit,
                            DestinationAccountState>(
                          listener: (context, state) {
                            if (state is DestinationAccountLoading) {
                              print("Now is loading..");
                            } else if (state is DestinationAccountError) {
                              print(state.errorMsg);
                              AlertMessage(
                                  "Informasi", state.errorMsg, "OK", context);
                            } else if (state is DestinationAccountSuccess) {
                              if (state.response.status == "OK") {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DeleteDstAccount(
                                      response: state.response,
                                      userid: widget.userid,
                                      noRek: widget.noRek,
                                      username: widget.username,
                                      custNo: widget.custNo,
                                      lastLogin: widget.lastLogin,
                                    ),
                                  ),
                                );
                              }
                            } else {
                              AlertMessage("Informasi", "Terjadi Kesalahan",
                                  "OK", context);
                            }
                          },
                          builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width:
                                    Responsive.isDesktop(context) ? 150 : 125,
                                height:
                                    Responsive.isDesktop(context) ? 150 : 125,
                                child: Card(
                                  elevation: 0.2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: InkWell(
                                    onTap: () {
                                      List<DstAccount> dstAccountList = [];
                                      dstAccountList.clear();
                                      DstAccount dstacc = DstAccount(
                                        accountName: widget.userid,
                                        accountNo: widget.noRek,
                                      );
                                      dstAccountList.add(dstacc);

                                      final destinationAccountRequest =
                                          DestinationAccountRequest(
                                              dstAccount: dstAccountList,
                                              mpin: "123456",
                                              procedure: "LOAD",
                                              username: widget.userid);

                                      context
                                          .read<DestinationAccountCubit>()
                                          .dstAccountName(
                                              destinationAccountRequest);
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/images/icons-new/icon_hapus_daftar_transfer.png',
                                          width: 45,
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          "Hapus Daftar Transfer",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 10,
                                            color: Colors.black87,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
