import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/ai%20chat/domain/repos/ai_chat_repo.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/message_entity.dart';

part 'get_ai_messages_state.dart';

class GetAiMessagesCubit extends Cubit<GetAiMessagesState> {
  GetAiMessagesCubit(this._aiChatRepo) : super(GetAiMessagesInitial());
  final AiChatRepo _aiChatRepo;
  final List<MessageEntity> messages = [];

  Future<void> getMessages() async {
    emit(GetAiMessagesLoading());
    messages.clear();
    final failureOrMessages = await _aiChatRepo.getMessages();
    failureOrMessages.fold(
      (failure) => emit(GetAiMessagesFailure(failure: failure.errMessage)),
      (messages) {
        this.messages.addAll(messages);
        emit(GetAiMessagesSuccess(messages: messages));
      },
    );
  }
}
