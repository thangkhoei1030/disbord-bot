import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

import '../../values/string.dart';
import 'base_class_command/base_class_command.dart';

class PingCommand extends BaseClassCommand<ChatCommand> {
  @override
  ChatCommand command() {
    return ChatCommand(
      BotStr.ping,
      BotStr.descriptionCheckBot,
      id('ping', (IChatContext context) {
        context.respond(MessageBuilder.content(BotStr.messageResponseCheckBot));
      }),
    );
  }
}
