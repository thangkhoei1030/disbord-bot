import 'package:nyxx_commands/nyxx_commands.dart';
import 'create_role/create_role.dart';
import 'create_role/delete_role.dart';
import 'create_role/give_role.dart';
import 'group_command.dart';
import 'message/clean_message.dart';
import 'ping_command.dart';
import 'user_command/change_user_command.dart';
import 'user_command/kick_user.dart';

class DiscordCommand {
  static DiscordCommand? _instance;

  factory DiscordCommand() => _instance ??= DiscordCommand._();

  DiscordCommand._();

  CommandsPlugin commandsPlugin = CommandsPlugin(
    prefix: (_) => "!",
  );

  void initialCommand() {
    CreateRole();
    GiveRole();
    PingCommand();
    GroupCommand();
    ChangeUserCommand();
    CleanMessage();
    KickUser();
    RemoveRole();
    // RoleManager();
  }
}
