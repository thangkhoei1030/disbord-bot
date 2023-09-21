import 'package:nyxx_commands/nyxx_commands.dart';

import '../base_class_command/base_class_command.dart';
import 'multi_kick_user.dart';
import 'simple_kick_user.dart';

class KickUser extends BaseClassCommand<ChatGroup> {
  @override
  ChatGroup command() {
    return ChatGroup("kick_user", "kick người dùng khỏi server", children: [
      KickUserSimple().command(),
      MultiKickUser().command(),
    ]);
  }
}
