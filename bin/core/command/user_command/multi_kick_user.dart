import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

import '../base_class_command/base_class_command.dart';

class MultiKickUser extends BaseClassCommand<ChatCommand> {
  MultiKickUser() : super(canAddcommand: false);
  @override
  ChatCommand command() {
    return ChatCommand("multi", "kick nhiều người dùng khỏi server",
        id("kick_user", _kickUser));
  }

  void _kickUser(
    IChatContext context,
    List<IMember> memberTarget,
  ) async {
    if ((await context.member?.effectivePermissions)?.kickMembers ?? false) {}
  }
}
