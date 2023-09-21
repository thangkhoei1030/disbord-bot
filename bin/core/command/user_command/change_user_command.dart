import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

import '../base_class_command/base_class_command.dart';

class ChangeUserCommand extends BaseClassCommand<ChatCommand> {
  @override
  ChatCommand command() {
    return ChatCommand(
      'change_nickname',
      "Thay đổi tên người dùng ",
      id('nick',
          (IChatContext context, IMember memberTarget, String newNick) async {
        try {
          await memberTarget.edit(builder: MemberBuilder()..nick = newNick);
        } on IHttpResponseError catch (e) {
          context.respond(MessageBuilder.content(
              "Couldn't change nickname :/\n${e.message}"));
          return;
        }
        deleteMessage(await context
            .respond(MessageBuilder.content('Successfully changed nickname!')));
      }),
    );
  }
}
