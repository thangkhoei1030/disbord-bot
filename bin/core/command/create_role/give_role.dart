import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

import '../base_class_command/base_class_command.dart';

class GiveRole extends BaseClassCommand<ChatCommand> {
  @override
  ChatCommand command() {
    return ChatCommand(
      'give',
      'give-role',
      id('give-role', _giveRole),
    );
  }

  void _giveRole(
    IChatContext context,
    @Description('Member nhận role') IMember member,
    IRole role,
  ) async {
    try {
      await (context.latestContext as IInteractionInteractiveContext)
          .acknowledge();
      await member.addRole(role);
    } catch (e) {
      print(e);
    }
  }
}
