import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/transInbox/trans_inbox_request.dart';
import 'package:wincoremobile/domain/model/transInbox/trans_inbox_response.dart';
import 'package:wincoremobile/repository/token_repository.dart';
import 'package:wincoremobile/repository/transInbox/trans_inbox_repository.dart';

part 'trans_inbox_state.dart';

class TransInboxCubit extends Cubit<TransInboxState> {
  TransInboxCubit() : super(TransInboxInitial());

  final TransInboxRepository _transInboxRepository = TransInboxRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void getTransInbox(TransInboxRequest transInboxRequest) async {
    emit(TransInboxLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _transInboxRepository.getTransInbox(
          token: _token.toString(), inboxRequest: transInboxRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold(
          (l) => emit(TransInboxError(l)), (r) => emit(TransInboxSuccess(r)));
    } catch (e) {
      emit(TransInboxError(e.toString()));
    }
  }
}
