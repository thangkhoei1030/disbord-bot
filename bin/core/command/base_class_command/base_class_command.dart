// import 'package:meta/meta.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';
import 'base_discord_command.dart';

abstract class BaseClassCommand<T extends IChatCommandComponent>
    extends BaseDiscordCommand {
  T command();
  void addCommand() {
    discordCommand.commandsPlugin.addCommand(
      command(),
    );
  }

  BaseClassCommand({bool canAddcommand = true}) {
    if (canAddcommand) {
      addCommand();
    }
  }
  
  Future<void> deleteMessage(IMessage iMessage, {int duration = 5}) async {
    await Future.delayed(Duration(seconds: duration));
    await iMessage.delete();
  }
}
