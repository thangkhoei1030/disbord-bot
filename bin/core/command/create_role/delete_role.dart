import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

import '../base_class_command/base_class_command.dart';

class RemoveRole extends BaseClassCommand<ChatCommand> {
  @override
  ChatCommand command() {
    return ChatCommand(
      'remove-role',
      'remove-role',
      id('remove-role', _removeRole),
    );
  }

  void _removeRole(
    IChatContext context,
    @Description('Member nhận role') IMember member,
    IRole role,
  ) async {
    try {
      await (context.latestContext as IInteractionInteractiveContext)
          .acknowledge();
      await member.removeRole(role);
      deleteMessage(
          await context.respond(MessageBuilder.content("Remove Role Success")));
    } catch (e) {
      deleteMessage(
          await context.respond(MessageBuilder.content("Remove Role Success")));
    }
  }
}
