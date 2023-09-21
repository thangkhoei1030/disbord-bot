import 'package:nyxx/nyxx.dart';

class ExceptionsResponse {
  static ExceptionsResponse? _instance;

  factory ExceptionsResponse() => _instance ??= ExceptionsResponse._();

  ExceptionsResponse._();

  void exceptionEvent(IMessage messageRequest) {
    final replyBuilder = ReplyBuilder.fromMessage(messageRequest);
    messageRequest.channel.sendMessage(
        MessageBuilder.content("Lệnh không hợp lệ xin vui lòng thử lại")
          ..replyBuilder = replyBuilder);
  }
}
