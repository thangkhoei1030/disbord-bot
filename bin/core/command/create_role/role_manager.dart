import 'package:nyxx_commands/nyxx_commands.dart';

import '../base_class_command/base_class_command.dart';
class RoleManager extends BaseClassCommand<ChatGroup> {
  @override
  ChatGroup command() {
    return ChatGroup(
      'role',
      'role manager',
      children: [
        // CreateRole().command(),
      ],
    );
  }
}
