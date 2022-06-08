// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class TransInboxResponse {
  List<Info>? info;
  String? status;

  TransInboxResponse({this.info, this.status});

  TransInboxResponse.fromJson(Map<String, dynamic> json) {
    if (json['info'] != null) {
      info = <Info>[];
      json['info'].forEach((v) {
        info!.add(new Info.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Info {
  String? endpoint;
  String? traceno;
  String? msgid;
  String? timestamp;
  String? username;
  TrData? trData;

  Info(
      {this.endpoint,
      this.traceno,
      this.msgid,
      this.timestamp,
      this.username,
      this.trData});

  Info.fromJson(Map<String, dynamic> json) {
    endpoint = json['endpoint'];
    traceno = json['traceno'];
    msgid = json['msgid'];
    timestamp = json['timestamp'];
    username = json['username'];
    trData =
        json['tr_data'] != null ? new TrData.fromJson(json['tr_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['endpoint'] = this.endpoint;
    data['traceno'] = this.traceno;
    data['msgid'] = this.msgid;
    data['timestamp'] = this.timestamp;
    data['username'] = this.username;
    if (this.trData != null) {
      data['tr_data'] = this.trData!.toJson();
    }
    return data;
  }
}

class TrData {
  int? amount;
  String? srcAccount;
  String? name;
  String? description;
  String? dstAccount;

  TrData(
      {this.amount,
      this.srcAccount,
      this.name,
      this.description,
      this.dstAccount});

  TrData.fromJson(Map<String, dynamic> json) {
    amount = int?.parse(json['amount'].toStringAsFixed(0));
    srcAccount = json['src_account'];
    name = json['name'];
    description = json['description'];
    dstAccount = json['dst_account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['src_account'] = this.srcAccount;
    data['name'] = this.name;
    data['description'] = this.description;
    data['dst_account'] = this.dstAccount;
    return data;
  }
}
