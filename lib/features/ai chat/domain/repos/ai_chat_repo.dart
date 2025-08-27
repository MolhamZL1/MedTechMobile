import 'package:dartz/dartz.dart';
import 'package:medtech_mobile/features/ai%20chat/domain/entities/message_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class AiChatRepo {
  Future<Either<Failure, MessageEntity>> sendMessage(String message);
  Future<Either<Failure, List<MessageEntity>>> getMessages();
}
