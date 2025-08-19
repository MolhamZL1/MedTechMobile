import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/core/services/database_service.dart';
import 'package:medtech_mobile/features/ai%20chat/data/models/message_model.dart';

import 'package:medtech_mobile/features/ai%20chat/domain/entities/message_entity.dart';

import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/repos/ai_chat_repo.dart';

class AiChatRepoImp extends AiChatRepo {
  final DatabaseService databaseService;

  AiChatRepoImp({required this.databaseService});
  @override
  Future<Either<Failure, List<MessageEntity>>> getMessages() async {
    try {
      var data = await databaseService.getData(
        endpoint: BackendEndpoints.getAiMessages,
      );
      List<MessageEntity> messages = List<MessageEntity>.from(
        data["messages"].map((e) => MessageModel.fromJson(e).toEntity()),
      );

      return right(messages);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> sendMessage(String message) async {
    try {
      var data = await databaseService.addData(
        endpoint: BackendEndpoints.sendAiMessage,
        data: {"content": message},
      );
      MessageEntity messageEntity = MessageModel.fromJson(data).toEntity();
      return right(messageEntity);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
