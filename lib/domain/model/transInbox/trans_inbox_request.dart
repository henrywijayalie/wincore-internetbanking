class TransInboxRequest {
  String? username;
  int? msgid;

  TransInboxRequest({this.username, this.msgid});

  TransInboxRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    msgid = json['msgid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['msgid'] = msgid;
    return data;
  }
}
