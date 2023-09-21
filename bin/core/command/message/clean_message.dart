import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

import '../base_class_command/base_class_command.dart';

class CleanMessage extends BaseClassCommand<ChatCommand> {
  List<IMessage>? _channelMessages;

  Snowflake? _last;

  List<IMessage> _listMessageDelete = [];

  bool checkCanCleanMessage = false;

  @override
  ChatCommand command() {
    return ChatCommand(
      "delete-message",
      "Delete message",
      id(
        "delete_message",
        _deleteMessageRequest,
      ),
      checks: [
        PermissionsCheck(PermissionsConstants.manageGuild),
      ],
    );
  }

  //List message of channel
  void _deleteMessageRequest(
    IChatContext context,
    @UseConverter(IntConverter(min: 1))
    @Description('The number of messages to delete')
    int countMessageDelete, [
    // default delete message everyone[ options delete message of user ]
    @Description('The user from whom to delete messages') IUser? user,
  ]) async {
    // await (context.latestContext as IInteractionInteractiveContext)
    //     .acknowledge();
    while (countMessageDelete > 0 &&
        (_channelMessages == null || _channelMessages!.isNotEmpty)) {
      //get list message with limit 100 message
      _channelMessages = await context.channel
          .downloadMessages(limit: countMessageDelete, after: _last)
          .toList();
      if (_channelMessages!.isNotEmpty) {
        _last = _channelMessages!.last.id;
        _listMessageDelete.clear();
        if (user == null) {
          _listMessageDelete
              .addAll(_channelMessages!.take(countMessageDelete).toList());
        } else {
          _listMessageDelete = _channelMessages!
              .where((message) => message.author.id == user.id)
              .toList();
        }
        try {
          await _deleteMesage(context);
          break;
        } on IHttpResponseError catch (error) {
          await _throwError(context, error);
        }
        countMessageDelete -= _listMessageDelete.length;
      } else {
        await _noMessageDeleteResponse(context);
        break;
      }
    }
    deleteMessage(
      await context
          .respond(MessageBuilder.content("Successfully deleted messages!")),
      duration: 1,
    );
  }

  Future<void> _noMessageDeleteResponse(IChatContext context) async {
    await deleteMessage(await context
        .respond(MessageBuilder.content("No messages want deleted")));
  }

  Future<void> _deleteMesage(IChatContext context) async {
    if (_listMessageDelete.length == 1) {
      await _listMessageDelete.first.delete();
    } else {
      await context.channel.bulkRemoveMessages(_listMessageDelete);
    }
    await deleteMessage(await context
        .respond(MessageBuilder.content('Successfully deleted messages!')));
  }

  Future<void> _throwError(
      IChatContext context, IHttpResponseError error) async {
    checkCanCleanMessage = false;
    await deleteMessage(await context.channel
        .sendMessage(MessageBuilder.content(error.message)));
  }
}
