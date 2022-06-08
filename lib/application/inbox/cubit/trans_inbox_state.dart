part of 'trans_inbox_cubit.dart';

@immutable
abstract class TransInboxState {}

class TransInboxInitial extends TransInboxState {}

class TransInboxLoading extends TransInboxState {}

class TransInboxError extends TransInboxState {
  final String errorMsg;
  TransInboxError(this.errorMsg);
}

class TransInboxSuccess extends TransInboxState {
  final TransInboxResponse response;
  TransInboxSuccess(this.response);
}
