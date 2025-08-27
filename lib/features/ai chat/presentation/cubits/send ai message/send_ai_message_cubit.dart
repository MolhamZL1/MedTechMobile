import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/ai%20chat/domain/entities/message_entity.dart';
import 'package:medtech_mobile/features/ai%20chat/domain/repos/ai_chat_repo.dart';
import 'package:meta/meta.dart';

part 'send_ai_message_state.dart';

class SendAiMessageCubit extends Cubit<SendAiMessageState> {
  SendAiMessageCubit(this.aiChatRepo) : super(SendAiMessageInitial());
  final AiChatRepo aiChatRepo;
  Future<void> sendMessage({required String content}) async {
    emit(SendAiMessageLoading());
    final failureOrMessages = await aiChatRepo.sendMessage(content);
    failureOrMessages.fold(
      (failure) => emit(SendAiMessageError(errMessage: failure.errMessage)),
      (message) {
        emit(SendAiMessageSuccess(messageEntity: message));
      },
    );
  }
}
