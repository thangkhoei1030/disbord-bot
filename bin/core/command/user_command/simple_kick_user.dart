import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

import '../base_class_command/base_class_command.dart';

class KickUserSimple extends BaseClassCommand<ChatCommand> {
  KickUserSimple() : super(canAddcommand: false);

  @override
  ChatCommand command() {
    return ChatCommand(
        "simple", "kick người dùng khỏi server", id("kick_user", _kickUser));
  }

  void _kickUser(
    IChatContext context,
    IMember memberTarget,
    String reason,
  ) async {
    try {
      await context.guild?.kick(memberTarget);

      deleteMessage(await context.respond(
          MessageBuilder.content("Kick successfully:\nReason: $reason")));
    } on IHttpResponseError catch (e) {
      deleteMessage(await context.respond(MessageBuilder.content(e.message)));
    }
  }
}
