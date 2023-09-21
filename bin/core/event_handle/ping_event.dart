import 'package:nyxx/nyxx.dart';

import 'base_class_event.dart';

class PingEvent extends BaseEventHanlde {
  PingEvent(super.messageRequest);

  @override
  Future<void> excute() async {
    final replyBuilder = ReplyBuilder.fromMessage(messageRequest);
    // AllowedMentions allowedMentions = AllowedMentions()..allow(reply: false);
    await messageRequest.channel.sendMessage(
        MessageBuilder.content('Pong!')..replyBuilder = replyBuilder);
  }
}
