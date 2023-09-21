import 'dart:math';

import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

import 'base_class_command/base_class_command.dart';

class GroupCommand extends BaseClassCommand<ChatGroup> {
  @override
  ChatGroup command() {
    ChatGroup throwGroup = ChatGroup(
      'request',
      'Request bot',
      children: [
        ChatCommand(
          'khen',
          'Khen nghĩa:) ',
          id('throw-coin1', (IChatContext context) {
            context.respond(MessageBuilder.content('Nghĩa đz'));
          }),
        ),
        ChatCommand(
          'che',
          'Chê nghĩa',
          id('throw-coin2', (IChatContext context) {
            context.respond(MessageBuilder.content('Nghĩa đéo đz'));
          }),
        ),
      ],
    );
    //C2 để add sub-command vào trong một danh sách sub-command của main-command
    throwGroup.addCommand(ChatCommand(
      'die',
      'Throw a die',
      id('throw-die', (IChatContext context) {
        int number = Random().nextInt(6) + 1;

        context
            .respond(MessageBuilder.content('The die landed on the $number!'));
      }),
    ));

    return throwGroup;
  }
}
