// ignore_for_file: non_constant_identifier_names, avoid_print, library_prefixes

import 'dart:io';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mailer/smtp_server.dart';
import 'package:wincoremobile/application/accountActivities/cubit/acc_activities_cubit.dart';
import 'package:wincoremobile/application/accountBalance/cubit/account_balance_cubit.dart';
import 'package:wincoremobile/application/accountDeposito/cubit/accountdeposito_cubit.dart';
import 'package:wincoremobile/application/accountPinjaman/cubit/accountpinjaman_cubit.dart';
import 'package:wincoremobile/application/portfolio/cubit/portfolio_cubit.dart';
import 'package:wincoremobile/application/transactions/pindahbuku/cubit/destination_account_cubit.dart';
import 'package:wincoremobile/application/transactions/pindahbuku/cubit/pindahbuku_cubit.dart';
import 'package:wincoremobile/domain/model/accountActivities/accActivities_request.dart';
import 'package:wincoremobile/domain/model/accountDeposito/accountDeposito_request.dart';
import 'package:wincoremobile/domain/model/accountInformation/accInformation_request.dart';
import 'package:wincoremobile/domain/model/portfolio/portfolio_request.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/dstAccount_request.dart'
    as dest_account;
import 'package:wincoremobile/domain/model/transactions/pindahbuku/pindahbuku_request.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/responsive.dart';
import 'package:wincoremobile/screen/panel/account/account_activities/account_activities_detail.dart';
import 'package:wincoremobile/screen/panel/account/account_balance/account_balance.dart';
import 'package:wincoremobile/screen/panel/account/account_deposito/account_deposito.dart';
import 'package:wincoremobile/screen/panel/account/account_pinjaman/account_pinjaman.dart';
import 'package:wincoremobile/screen/panel/account/portfolio/portfolio.dart';
import 'package:wincoremobile/screen/panel/settings/settings.dart';
import 'package:wincoremobile/screen/pulsa/pulsa.dart';
import 'package:wincoremobile/screen/transactions/pindah_buku/transfer_balance_result.dart';
import 'package:wincoremobile/domain/model/accountPinjaman/accountPinjaman_request.dart';
import 'package:mailer/mailer.dart';

Future<dynamic> modalBottomSheetPembayaran(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Pulsa()));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      FaIcon(FontAwesomeIcons.moneyBill),
                                      SizedBox(height: 20),
                                      Text(
                                        "Pulsa",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: "Montserrat",
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
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      FaIcon(
                                        FontAwesomeIcons.bolt,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Token Listrik",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: "Montserrat",
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
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      FaIcon(
                                        FontAwesomeIcons.briefcaseMedical,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Asuransi",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Montserrat",
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
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => Settings()));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      FaIcon(FontAwesomeIcons.water),
                                      SizedBox(height: 20),
                                      Text(
                                        "PDAM",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Montserrat",
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
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.phone,
                                        size: 30,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Telepon",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Montserrat",
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
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.phone_android,
                                        size: 30,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Pascabayar",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Montserrat",
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
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.wifi,
                                        size: 30,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "TV Kabel & Internet",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Montserrat",
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
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      FaIcon(
                                        FontAwesomeIcons.solidHandshake,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Pinjaman",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Montserrat",
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
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.local_play_rounded,
                                        size: 30,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Voucher",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Montserrat",
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
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      FaIcon(
                                        FontAwesomeIcons.creditCard,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Kartu Kredit",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Montserrat",
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}

Future<dynamic> M_PIN_AccInfoModalDialog(
    BuildContext context, String username, String userid, String accountNo) {
  final _MPINController = TextEditingController();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Token",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              color: Color(0xFF120A7C),
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          titlePadding: const EdgeInsets.all(10),
          content: BlocProvider(
            create: (context) => AccountBalanceCubit(),
            child: BlocConsumer<AccountBalanceCubit, AccountBalanceState>(
              listener: (context, state) {
                if (state is AccountBalanceLoading) {
                  print("Now is loading..");
                } else if (state is AccountBalanceError) {
                  print(state.errorMsg);
                } else if (state is AccountBalanceSuccess) {
                  if (state.accountInfoResponse.status == "OK") {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => AccountBalance(
                              response: state.accountInfoResponse,
                            )));
                  } else {
                    AlertMessage("Informasi", "PIN Salah", "OK", context);
                  }
                }
              },
              builder: (context, state) {
                return Stack(
                  children: <Widget>[
                    Form(
                      // key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            controller: _MPINController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                              color: Color(0xFF120A7C),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Token',
                              labelStyle: const TextStyle(
                                fontFamily: "Montserrat",
                                color: Color(0xFF120A7C),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          // if (Responsive.isDesktop(context) ||
                          //     Responsive.isTablet(context))
                          const SizedBox(height: 10),
                          SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 5
                                : MediaQuery.of(context).size.width / 2.5,
                            child: (state is AccountBalanceLoading)
                                ? const LoadingButton()
                                : ElevatedButton(
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xFF120A7C)),
                                    ),
                                    onPressed: () {
                                      final accInfoRequest = AccountInfoRequest(
                                          accountno: accountNo,
                                          username: userid,
                                          mpin: _MPINController.text);

                                      context
                                          .read<AccountBalanceCubit>()
                                          .getAccountInfo(accInfoRequest);
                                    },
                                  ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      });
}

Future<dynamic> M_PIN_AccActivitiesModalDialog(
    BuildContext context,
    String username,
    String userid,
    String accountNo,
    String startDate,
    String endDate,
    String seqNo) {
  final _MPINController = TextEditingController();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Token",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              color: Color(0xFF120A7C),
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          titlePadding: const EdgeInsets.all(10),
          content: BlocProvider(
            create: (context) => AccActivitiesCubit(),
            child: BlocConsumer<AccActivitiesCubit, AccActivitiesState>(
              listener: (context, state) {
                if (state is AccActivitiesLoading) {
                  print("Now is loading..");
                } else if (state is AccActivitiesError) {
                  print(state.errorMsg);
                } else if (state is AccActivitiesSuccess) {
                  if (state.accActivitiesResponse.status == "OK") {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => AccountActivitiesDetails(
                            response: state.accActivitiesResponse,
                            username: username,
                            noRek: accountNo,
                            startDate: startDate,
                            endDate: endDate,
                            userid: userid,
                            mpin: _MPINController.text)));
                    // print(state.accActivitiesResponse.status.toString());
                    // print(state.accActivitiesResponse.info?.eof.toString());
                    // print(state.accActivitiesResponse.info?.sequenceNo.toString());
                    // print(state.accActivitiesResponse.info?.mutasi?.toList().toString());
                  } else {
                    AlertMessage("Informasi", "PIN Salah", "OK", context);
                  }
                }
              },
              builder: (context, state) {
                return Stack(
                  children: <Widget>[
                    Form(
                      // key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            controller: _MPINController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                              color: Color(0xFF120A7C),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Token',
                              labelStyle: const TextStyle(
                                fontFamily: "Montserrat",
                                color: Color(0xFF120A7C),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          if (Responsive.isDesktop(context) ||
                              Responsive.isTablet(context))
                            const SizedBox(height: 10),
                          SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 5
                                : MediaQuery.of(context).size.width / 2.5,
                            child: (state is AccActivitiesLoading)
                                ? const LoadingButton()
                                : ElevatedButton(
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xFF120A7C)),
                                    ),
                                    onPressed: () {
                                      final accActivitiesRequest =
                                          AccountActivitiesRequest(
                                              accountno: accountNo,
                                              username: userid,
                                              mpin: _MPINController.text,
                                              enddate:
                                                  endDate.replaceAll("/", ""),
                                              startdate:
                                                  startDate.replaceAll("/", ""),
                                              sequenceno: seqNo);

                                      context
                                          .read<AccActivitiesCubit>()
                                          .getAccountActivities(
                                              accActivitiesRequest);
                                    },
                                  ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      });
}

Future<dynamic> M_PIN_AccActivitiesChangePageModalDialog(
    BuildContext context,
    String username,
    String userid,
    String accountNo,
    String startDate,
    String endDate,
    String seqNo) {
  final _MPINController = TextEditingController();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Token",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              color: Color(0xFF120A7C),
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          titlePadding: const EdgeInsets.all(10),
          content: BlocProvider(
            create: (context) => AccActivitiesCubit(),
            child: BlocConsumer<AccActivitiesCubit, AccActivitiesState>(
              listener: (context, state) {
                if (state is AccActivitiesPagingLoading) {
                  print("Now is loading..");
                } else if (state is AccActivitiesPagingError) {
                  print(state.errorMsg);
                } else if (state is AccActivitiesPagingSuccess) {
                  if (state.accActivitiesResponse.status == "OK") {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => AccountActivitiesDetails(
                            response: state.accActivitiesResponse,
                            username: username,
                            noRek: accountNo,
                            startDate: startDate,
                            endDate: endDate,
                            userid: userid,
                            mpin: _MPINController.text)));

                    print("Modal Change Page :");
                    print(state.accActivitiesResponse.status.toString());
                    print(state.accActivitiesResponse.info?.eof.toString());
                    print(state.accActivitiesResponse.info?.sequenceNo
                        .toString());
                    print(state.accActivitiesResponse.info?.mutasi
                        ?.toList()
                        .toString());
                  } else {
                    AlertMessage("Informasi", "PIN Salah", "OK", context);
                  }
                }
              },
              builder: (context, state) {
                return Stack(
                  children: <Widget>[
                    Form(
                      // key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            controller: _MPINController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                              color: Color(0xFF120A7C),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Token',
                              labelStyle: const TextStyle(
                                fontFamily: "Montserrat",
                                color: Color(0xFF120A7C),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          if (Responsive.isDesktop(context) ||
                              Responsive.isTablet(context))
                            const SizedBox(height: 10),
                          SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 5
                                : MediaQuery.of(context).size.width / 2.5,
                            child: (state is AccActivitiesPagingLoading)
                                ? const LoadingButton()
                                : ElevatedButton(
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xFF120A7C)),
                                    ),
                                    onPressed: () {
                                      final accActivitiesRequest =
                                          AccountActivitiesRequest(
                                              accountno: accountNo,
                                              username: userid,
                                              mpin: _MPINController.text,
                                              enddate:
                                                  endDate.replaceAll("/", ""),
                                              startdate:
                                                  startDate.replaceAll("/", ""),
                                              sequenceno: seqNo);

                                      context
                                          .read<AccActivitiesCubit>()
                                          .getAccountActivitiesPaging(
                                              accActivitiesRequest);
                                    },
                                  ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      });
}

Future<dynamic> M_PIN_PindahBukuModalDialog(
    BuildContext context,
    String username,
    String userid,
    String accountNo,
    String accountNoDst,
    String usernameDst,
    int amount,
    String keterangan,
    String custNo,
    String lastLogin,
    bool isChecked) {
  final _MPINController = TextEditingController();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Token",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              color: Color(0xFF120A7C),
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          titlePadding: const EdgeInsets.all(10),
          content: BlocProvider(
            create: (context) => PindahbukuCubit(),
            child: BlocConsumer<PindahbukuCubit, PindahbukuState>(
              listener: (context, state) {
                if (state is PindahbukuLoading) {
                  print("Now is loading..");
                } else if (state is PindahbukuError) {
                  print(state.errorMsg);
                  AlertDialog(
                    content: Text(state.errorMsg),
                  );
                } else if (state is PindahbukuSuccess) {
                  if (state.response.status == "SUCCESS") {
                    String nomorReferensi = state.response.refNo.toString();
                    String nominalTransaksi = amount.toString();
                    String nomorRekeningPengirim = accountNo;
                    String namaPengirim = username;
                    String nomorRekeningPenerima = accountNoDst;
                    String namaPenerima = usernameDst;
                    String waktuTransaksi = DateFormat("yyyy/MM/dd HH:mm:ss")
                        .format(DateTime.now());

                    String report = "";
                    if (Platform.isAndroid || Platform.isIOS) {
                      final String template =
                          "<table style=\"width: 100%;\"><tr style=\"text-align: center;\"> <td colspan=\"3\" style=\"text-align: center;\"> <h3>Transaksi anda berhasil</h3> </td></tr><tr style=\"text-align: center;\"> <td colspan=\"3\" style=\"text-align: left;\"> Terima kasih telah bertransaksi menggunakan WINCore Mobile. Berikut terlampir informasi transaksi anda. <br/> <br/> </td></tr><tr style=\"text-align: center;\"> <td style=\"text-align: left;\">Nomor Referensi</td><td>:</td><td style=\"text-align: right;\">$nomorReferensi</td></tr><tr style=\"text-align: center;\"> <td style=\"text-align: left;\">Nilai Transaksi</td><td>:</td><td style=\"text-align: right;\">$nominalTransaksi</td></tr><tr style=\"text-align: center;\"> <td style=\"text-align: left;\">Nomor Rekening Pengirim</td><td>:</td><td style=\"text-align: right;\">$nomorRekeningPengirim</td></tr><tr style=\"text-align: center;\"> <td style=\"text-align: left;\">Nama Pengirim</td><td>:</td><td style=\"text-align: right;\">$namaPengirim</td></tr><tr style=\"text-align: center;\"> <td style=\"text-align: left;\">Nomor Rekening Penerima</td><td>:</td><td style=\"text-align: right;\">$nomorRekeningPenerima</td></tr><tr style=\"text-align: center;\"> <td style=\"text-align: left;\">Nama Penerima</td><td>:</td><td style=\"text-align: right;\">$namaPenerima</td></tr><tr style=\"text-align: center;\"> <td style=\"text-align: left;\">Waktu Transaksi</td><td>:</td><td style=\"text-align: right;\">$waktuTransaksi</td></tr></table> <br><br><div> Silahkan melakukan konfirmasi transaksi ini dengan Penerima Saldo. <br/> Notifikasi ini dikirim secara otomatis oleh sistem, mohon untuk tidak membalas email ini. </div>";

                      sendmail(template, report);
                    }

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => TransferBalanceResult(
                          response: state.response,
                          accountNo: accountNo,
                          userid: userid,
                          username: username,
                          accountNoDst: accountNoDst,
                          usernameDst: usernameDst,
                          amount: amount.toString(),
                          custNo: custNo,
                          waktuTransaksi: waktuTransaksi,
                          lastLogin: lastLogin,
                          status: report,
                        ),
                      ),
                    );
                    print(state.response.status.toString());
                  } else {
                    AlertMessage("Informasi", "PIN Salah", "OK", context);
                  }
                }
              },
              builder: (context, state) {
                Map<String, dynamic> destinationAcc = {
                  "account_no": accountNoDst.toString(),
                  "account_name": usernameDst.toString(),
                  "amount": amount
                };
                var decodedDstAcc = jsonDecode(jsonEncode(destinationAcc));
                print("DestinationAcc : " + decodedDstAcc.toString());
                var dst = DstAccount.fromJson(destinationAcc);
                print("accNo : " +
                    dst.accountNo.toString() +
                    " amout : " +
                    dst.amount.toString());

                List<DstAccount>? dstAccount = [];
                dstAccount.clear();
                DstAccount dsta = DstAccount(
                  accountNo: dst.accountNo.toString(),
                  accountName: dst.accountName,
                  amount: dst.amount,
                );
                dstAccount.add(dsta);

                // var decodedDstAcc1 =
                //     (jsonDecode(jsonEncode(destinationAcc)) as List)
                //         .map((e) => DstAccount.fromJson(destinationAcc))
                //         .toList();

                // Map<String, dynamic> dstAccRequest = {
                //   "accountNo": accountNoDst,
                //   "accountName": usernameDst,
                // };
                // var destAccRequest =
                //     dest_account.DestAccount.fromJson(dstAccRequest);

                List<dest_account.DstAccount> dstAccountList = [];
                dstAccountList.clear();
                dest_account.DstAccount dstacc = dest_account.DstAccount(
                  accountName: usernameDst,
                  accountNo: accountNoDst,
                );
                dstAccountList.add(dstacc);

                // print("accountName : " +
                //     dstAccountList[0].accountName.toString() +
                //     " accountNo :" +
                //     dstAccountList[0].accountNo.toString());

                return Stack(
                  children: <Widget>[
                    Form(
                      // key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            controller: _MPINController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                              color: Color(0xFF120A7C),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Token',
                              labelStyle: const TextStyle(
                                fontFamily: "Montserrat",
                                color: Color(0xFF120A7C),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          if (Responsive.isDesktop(context) ||
                              Responsive.isTablet(context))
                            const SizedBox(height: 10),
                          SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 5
                                : MediaQuery.of(context).size.width / 2.5,
                            child: (state is PindahbukuLoading)
                                ? const LoadingButton()
                                : ElevatedButton(
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xFF120A7C)),
                                    ),
                                    onPressed: () {
                                      // final destinationAccount = DstAccount(
                                      //     accountNo: accountNoDst, amount: amount);

                                      // print("dstnAccount " + dstnAccount!.first.toString());
                                      final pindahBukuRequest =
                                          PindahBukuRequest(
                                        dstAccount: dstAccount,
                                        username: userid,
                                        mpin: _MPINController.text,
                                        srcAccount: accountNo,
                                        description: keterangan,
                                      );

                                      final destinationAccountRequest =
                                          dest_account
                                              .DestinationAccountRequest(
                                                  dstAccount: dstAccountList,
                                                  mpin: _MPINController.text,
                                                  procedure: "ADD",
                                                  username: userid);

                                      context
                                          .read<PindahbukuCubit>()
                                          .sendBalance(
                                              pindahBukuRequest,
                                              destinationAccountRequest,
                                              isChecked);
                                    },
                                  ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      });
}

Future<dynamic> M_PIN_PortfolioModalDialog(
  BuildContext context,
  String username,
  String userid,
  String accountNo,
  String custNo,
  String seqNo,
) {
  final _MPINController = TextEditingController();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Token",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              color: Color(0xFF120A7C),
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          titlePadding: const EdgeInsets.all(10),
          content: BlocProvider(
            create: (context) => PortfolioCubit(),
            child: BlocConsumer<PortfolioCubit, PortfolioState>(
              listener: (context, state) {
                if (state is PortfolioLoading) {
                  print("Now is loading..");
                } else if (state is PortfolioError) {
                  print(state.errorMsg);
                } else if (state is PortfolioSuccess) {
                  if (state.response.status == "OK") {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Portfolio(
                          response: state.response,
                          userid: userid,
                          username: username,
                          CIF: custNo,
                          mpin: _MPINController.text,
                        ),
                      ),
                    );
                    // print(state.accActivitiesResponse.status.toString());
                    // print(state.accActivitiesResponse.info?.eof.toString());
                    // print(state.accActivitiesResponse.info?.sequenceNo.toString());
                    // print(state.accActivitiesResponse.info?.mutasi?.toList().toString());
                  } else {
                    AlertMessage("Informasi", "PIN Salah", "OK", context);
                  }
                }
              },
              builder: (context, state) {
                return Stack(
                  children: <Widget>[
                    Form(
                      // key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            controller: _MPINController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                              color: Color(0xFF120A7C),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Token',
                              labelStyle: const TextStyle(
                                fontFamily: "Montserrat",
                                color: Color(0xFF120A7C),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          if (Responsive.isDesktop(context) ||
                              Responsive.isTablet(context))
                            const SizedBox(height: 10),
                          SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 5
                                : MediaQuery.of(context).size.width / 2.5,
                            child: (state is PortfolioLoading)
                                ? const LoadingButton()
                                : ElevatedButton(
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xFF120A7C)),
                                    ),
                                    onPressed: () {
                                      final portfolioRequest = PortfolioRequest(
                                        username: userid,
                                        mpin: _MPINController.text,
                                        sequenceno: seqNo,
                                        filter: "",
                                      );

                                      context
                                          .read<PortfolioCubit>()
                                          .getPortfolio(portfolioRequest);
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      });
}

Future<dynamic> M_PIN_DepositoModalDialog(
  BuildContext context,
  String username,
  String userid,
  String accountNo,
  String custNo,
  String seqNo,
) {
  final _MPINController = TextEditingController();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Token",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              color: Color(0xFF120A7C),
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          titlePadding: const EdgeInsets.all(10),
          content: BlocProvider(
            create: (context) => AccountdepositoCubit(),
            child: BlocConsumer<AccountdepositoCubit, AccountdepositoState>(
              listener: (context, state) {
                if (state is DepositoLoading) {
                  print("Now is loading..");
                } else if (state is DepositoError) {
                  print(state.errorMsg);
                } else if (state is DepositoSuccess) {
                  if (state.response.status == "OK") {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => AccountDeposito(
                          response: state.response,
                          userid: userid,
                          username: username,
                          CIF: custNo,
                          mpin: _MPINController.text,
                          no_rek: accountNo,
                        ),
                      ),
                    );
                    // print(state.accActivitiesResponse.status.toString());
                    // print(state.accActivitiesResponse.info?.eof.toString());
                    // print(state.accActivitiesResponse.info?.sequenceNo.toString());
                    // print(state.accActivitiesResponse.info?.mutasi?.toList().toString());
                  } else {
                    AlertMessage("Informasi", "PIN Salah", "OK", context);
                  }
                }
              },
              builder: (context, state) {
                return Stack(
                  children: <Widget>[
                    Form(
                      // key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            controller: _MPINController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                              color: Color(0xFF120A7C),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Token',
                              labelStyle: const TextStyle(
                                fontFamily: "Montserrat",
                                color: Color(0xFF120A7C),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          if (Responsive.isDesktop(context) ||
                              Responsive.isTablet(context))
                            const SizedBox(height: 10),
                          SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 5
                                : MediaQuery.of(context).size.width / 2.5,
                            child: (state is DepositoLoading)
                                ? const LoadingButton()
                                : ElevatedButton(
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xFF120A7C)),
                                    ),
                                    onPressed: () {
                                      final depositoRequest = DepositoRequest(
                                        username: userid,
                                        mpin: _MPINController.text,
                                        sequenceno: seqNo,
                                        filter: "DEPOSITO",
                                      );

                                      context
                                          .read<AccountdepositoCubit>()
                                          .getDeposito(depositoRequest);
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      });
}

Future<dynamic> M_PIN_PinjamanModalDialog(
  BuildContext context,
  String username,
  String userid,
  String accountNo,
  String custNo,
  String seqNo,
) {
  final _MPINController = TextEditingController();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Token",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              color: Color(0xFF120A7C),
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          titlePadding: const EdgeInsets.all(10),
          content: BlocProvider(
            create: (context) => AccountpinjamanCubit(),
            child: BlocConsumer<AccountpinjamanCubit, AccountpinjamanState>(
              listener: (context, state) {
                if (state is PinjamanLoading) {
                  print("Now is loading..");
                } else if (state is PinjamanError) {
                  print(state.errorMsg);
                } else if (state is PinjamanSuccess) {
                  if (state.response.status == "OK") {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => AccountPinjaman(
                          response: state.response,
                          userid: userid,
                          username: username,
                          CIF: custNo,
                          mpin: _MPINController.text,
                          no_rek: accountNo,
                        ),
                      ),
                    );
                    print(state.response.toString());
                    print(userid.toString());
                    print(username.toString());
                    print(custNo.toString());
                    print(_MPINController.text);
                    print(accountNo);
                  } else {
                    AlertMessage("Informasi", "PIN Salah", "OK", context);
                  }
                }
              },
              builder: (context, state) {
                return Stack(
                  children: <Widget>[
                    Form(
                      // key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            controller: _MPINController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                              color: Color(0xFF120A7C),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Token',
                              labelStyle: const TextStyle(
                                fontFamily: "Montserrat",
                                color: Color(0xFF120A7C),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          if (Responsive.isDesktop(context) ||
                              Responsive.isTablet(context))
                            const SizedBox(height: 10),
                          SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 5
                                : MediaQuery.of(context).size.width / 2.5,
                            child: (state is PinjamanLoading)
                                ? const LoadingButton()
                                : ElevatedButton(
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xFF120A7C)),
                                    ),
                                    onPressed: () {
                                      final pinjamanRequest = PinjamanRequest(
                                        username: userid,
                                        mpin: _MPINController.text,
                                        sequenceno: seqNo,
                                        filter: "PINJAMAN",
                                      );

                                      context
                                          .read<AccountpinjamanCubit>()
                                          .getPinjaman(pinjamanRequest);
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      });
}

Future<dynamic> M_PIN_DeleteDstAccountModalDialog(
  BuildContext context,
  String dstAccountName,
  String dstAccountNo,
  String userid,
  String username,
  String accountNo,
  String custNo,
  String lastLogin,
) {
  final _MPINController = TextEditingController();
  return showDialog(
    context: context,
    useSafeArea: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Token",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            color: Color(0xFF120A7C),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        titlePadding: const EdgeInsets.all(10),
        content: BlocProvider(
          create: (context) => DestinationAccountCubit(),
          child: BlocConsumer<DestinationAccountCubit, DestinationAccountState>(
            listener: (context, state) {
              if (state is DestinationAccountLoading) {
                print("Now is loading..");
              } else if (state is DestinationAccountError) {
                print(state.errorMsg);
                AlertMessage("Informasi", state.errorMsg, "OK", context);
              } else if (state is DestinationAccountSuccess) {
                if (state.response.status == "OK") {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Settings(
                        noRek: accountNo,
                        username: username,
                        userid: userid,
                        custNo: custNo,
                        lastLogin: lastLogin,
                      ),
                    ),
                  );
                  AlertMessage(
                      "Informasi",
                      "Rekening yang anda pilih berhasil dihapus",
                      "OK",
                      context);
                } else {
                  AlertMessage("Informasi", "PIN Salah", "OK", context);
                }
              }
            },
            builder: (context, state) {
              return Stack(
                children: <Widget>[
                  Form(
                    // key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          controller: _MPINController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                            color: Color(0xFF120A7C),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6),
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Token',
                            labelStyle: const TextStyle(
                              fontFamily: "Montserrat",
                              color: Color(0xFF120A7C),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        if (Responsive.isDesktop(context) ||
                            Responsive.isTablet(context))
                          const SizedBox(height: 10),
                        SizedBox(
                          width: Responsive.isDesktop(context)
                              ? MediaQuery.of(context).size.width / 5
                              : MediaQuery.of(context).size.width / 2.5,
                          child: (state is DestinationAccountLoading)
                              ? const LoadingButton()
                              : ElevatedButton(
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF120A7C)),
                                  ),
                                  onPressed: () {
                                    List<dest_account.DstAccount>
                                        dstAccountList = [];
                                    dstAccountList.clear();
                                    dest_account.DstAccount dstacc =
                                        dest_account.DstAccount(
                                      accountName: dstAccountName,
                                      accountNo: dstAccountNo,
                                    );
                                    dstAccountList.add(dstacc);

                                    final destinationAccountRequest =
                                        dest_account.DestinationAccountRequest(
                                            dstAccount: dstAccountList,
                                            mpin: _MPINController.text,
                                            procedure: "DELETE",
                                            username: userid);

                                    context
                                        .read<DestinationAccountCubit>()
                                        .dstAccountName(
                                            destinationAccountRequest);
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const SizedBox(
        width: 25,
        height: 25,
        child: CircularProgressIndicator(
          strokeWidth: 1,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF120A7C)),
      ),
      onPressed: null,
    );
  }
}

Future<String> sendmail(template, report) async {
  try {
    const usernameEmail = 'hwijaya@warna-bintang.co.id';
    const passwordEmail = 'Wbk#1310';
    final smtpServer = SmtpServer(
      'smtp.cbn.net.id',
      port: 465,
      username: usernameEmail,
      password: passwordEmail,
      ssl: true,
      ignoreBadCertificate: false,
      allowInsecure: false,
    );

    final message = Message()
      ..from = const Address(usernameEmail, 'WINCore Mobile')
      ..recipients.add('wbk.dev@gmail.com')
      ..subject = 'WINCore Mobile Transaction Report :: ${DateTime.now()}'
      ..html = template;

    final sendReport = await send(
      message,
      smtpServer,
    );
    print('Message sent: ' + sendReport.toString());
    stdout.write(sendReport);

    report = sendReport.toString();

    AlertDialog(
      content: Text(sendReport.toString()),
    );
  } on MailerException catch (e) {
    report = "Message not sent. || ";
    for (var p in e.problems) {
      report += "Problem: ${p.code}: ${p.msg} || ";
    }
    stdout.write("Message not sent. || " + report);
    print("Message not sent. || " + report);
    AlertDialog(
      content: Text('Message not sent. || ' + report.toString()),
    );
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
  return report;
}
