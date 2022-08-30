// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_print, lowerCamelCase, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wincoremobile/application/changeMPIN/cubit/change_mpin_cubit.dart';
import 'package:wincoremobile/component/side_menu.dart';
import 'package:wincoremobile/controllers/MenuController.dart';
import 'package:wincoremobile/domain/model/changeMPIN/changeMPIN_request.dart';
import 'package:wincoremobile/responsive.dart';
import 'package:wincoremobile/screen/panel/home/home.dart';

enum ValidationMPINState {
  notset,
  sameMPinWithConfirm,
  diffMPinWithConfirm,
}

class ChangeMPIN extends StatefulWidget {
  ChangeMPIN({
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
  State<ChangeMPIN> createState() => _ChangeMPINState();
}

class _ChangeMPINState extends State<ChangeMPIN> {
  final myPhoneNumberController = TextEditingController();
  final myRekeningController = TextEditingController();
  final _oldMPINLamaController = TextEditingController();
  final _newMPINLamaController = TextEditingController();
  final _reMPINLamaController = TextEditingController();

  ValidationMPINState currentMPINState = ValidationMPINState.notset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Change M-PIN",
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
                child: Container(
                  constraints: BoxConstraints.expand(),
                  height: MediaQuery.of(context).size.height / 1.05,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocProvider(
                          create: (context) => ChangeMpinCubit(),
                          child: BlocConsumer<ChangeMpinCubit, ChangeMpinState>(
                            listener: (context, state) {
                              if (state is MpinLoading) {
                                print("Now is loading");
                              } else if (state is MpinError) {
                                print(state.errorMsg);
                              } else if (state
                                  is ChangeMpinSuccessRestoreState) {
                                print(state.chagesMpinResponse);
                                if (state.chagesMpinResponse.status ==
                                    "CHANGE_OK") {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                        title: const Text(
                                          "Informasi",
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                          ),
                                        ),
                                        content: const Text(
                                          "MPIN kamu berhasil diperbarui !",
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                          ),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            child: const Text(
                                              'OK',
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) => Home(
                                                    username: widget.username,
                                                    noRek: widget.noRek,
                                                    userid: widget.userid,
                                                    custNo: widget.custNo,
                                                    lastLogin: widget.lastLogin,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ]),
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                        title: const Text(
                                          "Informasi",
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                          ),
                                        ),
                                        content: const Text(
                                          "PIN yang kamu masukkan tidak valid.",
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                          ),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            child: const Text(
                                              'OK',
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) => Home(
                                                    noRek: widget.noRek,
                                                    username: widget.username,
                                                    userid: widget.userid,
                                                    custNo: widget.custNo,
                                                    lastLogin: widget.lastLogin,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ]),
                                  );
                                }
                              }
                            },
                            builder: (context, state) {
                              return SafeArea(
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        // Align(
                                        //   alignment: Alignment.topLeft,
                                        //   child: GestureDetector(
                                        //     onTap: () => Navigator.pop(context),
                                        //     child: Icon(
                                        //       Icons.arrow_back,
                                        //       size: 32,
                                        //       color: Colors.grey.shade400,
                                        //     ),
                                        //   ),
                                        // ),
                                        // const Text(
                                        //   'Ubah M-PIN',
                                        //   style: TextStyle(
                                        //     fontSize: 22,
                                        //     fontWeight: FontWeight.bold,
                                        //     color: Colors.white,
                                        //     fontFamily: "Montserrat",
                                        //   ),
                                        // ),
                                        // const SizedBox(
                                        //   height: 28,
                                        // ),
                                        Container(
                                          padding: const EdgeInsets.all(22),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            children: [
                                              TextField(
                                                controller:
                                                    _oldMPINLamaController,
                                                keyboardType:
                                                    TextInputType.number,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Montserrat",
                                                ),
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      6),
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black38),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black38),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  labelText: 'M-PIN Lama',
                                                  labelStyle: TextStyle(
                                                    fontFamily: "Montserrat",
                                                    color: Colors.blue.shade700,
                                                  ),
                                                  isDense: true, // Added this
                                                  contentPadding:
                                                      const EdgeInsets.all(
                                                          12), // Added this
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              TextFormField(
                                                controller:
                                                    _newMPINLamaController,
                                                keyboardType:
                                                    TextInputType.number,
                                                style: const TextStyle(
                                                  //color: Colors.blueAccent,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Montserrat",
                                                ),
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      6),
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                                onChanged: (value) {
                                                  if (value !=
                                                          _reMPINLamaController
                                                              .text ||
                                                      value.length < 6) {
                                                    setState(
                                                      () {
                                                        currentMPINState =
                                                            ValidationMPINState
                                                                .diffMPinWithConfirm;
                                                      },
                                                    );
                                                  } else if (value.length < 6) {
                                                    setState(
                                                      () {
                                                        currentMPINState =
                                                            ValidationMPINState
                                                                .diffMPinWithConfirm;
                                                      },
                                                    );
                                                  } else {
                                                    setState(() {
                                                      currentMPINState =
                                                          ValidationMPINState
                                                              .sameMPinWithConfirm;
                                                    });
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black38),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black38),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  labelText: 'M-PIN Baru',
                                                  labelStyle: TextStyle(
                                                    fontFamily: "Montserrat",
                                                    color: Colors.blue.shade700,
                                                  ),
                                                  isDense: true, // Added this
                                                  contentPadding:
                                                      const EdgeInsets.all(
                                                          12), // Added this
                                                ),
                                                validator: (value) {
                                                  if (value !=
                                                      _reMPINLamaController
                                                          .text) {
                                                    return 'M-PIN tidak sama dengan yang diketikan ulang';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              TextFormField(
                                                controller:
                                                    _reMPINLamaController,
                                                keyboardType:
                                                    TextInputType.number,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Montserrat",
                                                ),
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      6),
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black38),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black38),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  labelText:
                                                      'Ketik Ulang M-PIN Baru',
                                                  labelStyle: TextStyle(
                                                    //fontWeight: FontWeight.w900,
                                                    fontFamily: "Montserrat",
                                                    color: Colors.blue.shade700,
                                                  ),
                                                  isDense: true, // Added this
                                                  contentPadding:
                                                      const EdgeInsets.all(
                                                          12), // Added this
                                                ),
                                                onChanged: (value) {
                                                  if (value !=
                                                      _newMPINLamaController
                                                          .text) {
                                                    setState(
                                                      () {
                                                        currentMPINState =
                                                            ValidationMPINState
                                                                .diffMPinWithConfirm;
                                                      },
                                                    );
                                                  } else if (value.length < 6) {
                                                    setState(
                                                      () {
                                                        currentMPINState =
                                                            ValidationMPINState
                                                                .diffMPinWithConfirm;
                                                      },
                                                    );
                                                  } else {
                                                    setState(() {
                                                      currentMPINState =
                                                          ValidationMPINState
                                                              .sameMPinWithConfirm;
                                                    });
                                                  }
                                                },
                                                validator: (value) {
                                                  if (value !=
                                                          _newMPINLamaController
                                                              .text ||
                                                      value!.length < 6) {
                                                    return 'M-PIN tidak sama dengan yang diketikan ulang';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: 233,
                                                margin: const EdgeInsets.only(
                                                    top: 10),
                                                child: (currentMPINState ==
                                                        ValidationMPINState
                                                            .sameMPinWithConfirm)
                                                    ? ((state is MpinLoading)
                                                        ? _flatLoadingButton()
                                                        : verifyButton(context))
                                                    : disabledButton(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
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
    //);
  }

  ElevatedButton disabledButton() {
    return ElevatedButton(
      onPressed: null,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "Kirim",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: "Montserrat",
          ),
        ),
      ),
    );
  }

  ElevatedButton _flatLoadingButton() {
    return ElevatedButton(
      onPressed: null,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 2,
        ),
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
      ),
    );
  }

  ElevatedButton verifyButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final mpinRequest = MpinRequest(
          username: widget.userid,
          oldpin: _oldMPINLamaController.text,
          newpin: _newMPINLamaController.text,
        );

        context.read<ChangeMpinCubit>().changeMpin(mpinRequest);
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "Kirim",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
