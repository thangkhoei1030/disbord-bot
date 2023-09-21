import 'dart:developer';

import 'package:nyxx_commands/nyxx_commands.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import '../base_class_command/base_class_command.dart';
import 'package:nyxx/nyxx.dart';

import 'values.dart';

class CreateRole extends BaseClassCommand<ChatCommand> {
  @override
  ChatCommand command() {
    return ChatCommand(
      'create',
      'create-role',
      id('role-create', _roleCreate),
    );
  }

  void _roleCreate(
      IChatContext context,
      @Description('Set role names') String roleName,
      @Autocomplete(_autocompletePokemonName) String permission) async {
    try {
      await (context.latestContext as IInteractionInteractiveContext)
          .acknowledge(
        level: ResponseLevel.hint,
      );
      await context.guild!.createRole(
        RoleBuilder(
          roleName,
          permission: getPermissionBuilder(permission),
          hoist: true,
        ),
      );
      deleteMessage(
          await context.respond(MessageBuilder.content("Tạo role Thành công")));
    } catch (e) {
      log(e.toString());
    }
  }

  PermissionEnum _permissionSelected(String permissionSelected) {
    late final PermissionEnum permission;
    CreateRoleValues.rolePermissions.forEach((key, value) {
      if (value == permissionSelected) {
        permission = key;
      }
    });
    return permission;
  }

  PermissionsBuilder getPermissionBuilder(String permissionSelected) {
    return PermissionsBuilder(
      addReactions: _permissionSelected(permissionSelected) ==
          PermissionEnum.addReactions,
      administrator: _permissionSelected(permissionSelected) ==
          PermissionEnum.administrator,
      attachFiles:
          _permissionSelected(permissionSelected) == PermissionEnum.attachFiles,
      banMembers:
          _permissionSelected(permissionSelected) == PermissionEnum.banMembers,
      changeNickname: _permissionSelected(permissionSelected) ==
          PermissionEnum.changeNickname,
      connect:
          _permissionSelected(permissionSelected) == PermissionEnum.connect,
      createInstantInvite: _permissionSelected(permissionSelected) ==
          PermissionEnum.createInstantInvite,
      createPrivateThreads: _permissionSelected(permissionSelected) ==
          PermissionEnum.createPrivateThreads,
      createPublicThreads: _permissionSelected(permissionSelected) ==
          PermissionEnum.createPublicThreads,
      deafenMembers: _permissionSelected(permissionSelected) ==
          PermissionEnum.deafenMembers,
      embedLinks:
          _permissionSelected(permissionSelected) == PermissionEnum.embedLinks,
      kickMembers:
          _permissionSelected(permissionSelected) == PermissionEnum.kickMembers,
      manageChannels: _permissionSelected(permissionSelected) ==
          PermissionEnum.manageChannels,
      manageEmojisAndStickers: _permissionSelected(permissionSelected) ==
          PermissionEnum.manageEmojisAndStickers,
      manageEvents: _permissionSelected(permissionSelected) ==
          PermissionEnum.manageEvents,
      manageGuild:
          _permissionSelected(permissionSelected) == PermissionEnum.manageGuild,
      manageMessages: _permissionSelected(permissionSelected) ==
          PermissionEnum.manageMessages,
      manageNicknames: _permissionSelected(permissionSelected) ==
          PermissionEnum.manageNicknames,
      manageRoles:
          _permissionSelected(permissionSelected) == PermissionEnum.manageRoles,
      manageThreads: _permissionSelected(permissionSelected) ==
          PermissionEnum.manageThreads,
      manageWebhooks: _permissionSelected(permissionSelected) ==
          PermissionEnum.manageWebhooks,
      mentionEveryone: _permissionSelected(permissionSelected) ==
          PermissionEnum.mentionEveryone,
      moderateMembers: _permissionSelected(permissionSelected) ==
          PermissionEnum.moderateMembers,
      moveMembers:
          _permissionSelected(permissionSelected) == PermissionEnum.moveMembers,
      muteMembers:
          _permissionSelected(permissionSelected) == PermissionEnum.muteMembers,
      prioritySpeaker: _permissionSelected(permissionSelected) ==
          PermissionEnum.prioritySpeaker,
      readMessageHistory: _permissionSelected(permissionSelected) ==
          PermissionEnum.readMessageHistory,
      sendMessages: _permissionSelected(permissionSelected) ==
          PermissionEnum.sendMessages,
      requestToSpeak: _permissionSelected(permissionSelected) ==
          PermissionEnum.requestToSpeak,
      sendMessagesInThreads: _permissionSelected(permissionSelected) ==
          PermissionEnum.sendMessagesInThreads,
      sendTtsMessages: _permissionSelected(permissionSelected) ==
          PermissionEnum.sendTtsMessages,
      speak: _permissionSelected(permissionSelected) == PermissionEnum.speak,
      stream: _permissionSelected(permissionSelected) == PermissionEnum.stream,
      useExternalEmojis: _permissionSelected(permissionSelected) ==
          PermissionEnum.useExternalEmojis,
      useExternalStickers: _permissionSelected(permissionSelected) ==
          PermissionEnum.useExternalStickers,
      useSlashCommands: _permissionSelected(permissionSelected) ==
          PermissionEnum.useSlashCommands,
      useVad: _permissionSelected(permissionSelected) == PermissionEnum.useVad,
      viewAuditLog: _permissionSelected(permissionSelected) ==
          PermissionEnum.viewAuditLog,
      viewChannel:
          _permissionSelected(permissionSelected) == PermissionEnum.viewChannel,
      viewGuildInsights: _permissionSelected(permissionSelected) ==
          PermissionEnum.viewGuildInsights,
    );
  }

  static Map<String, dynamic> _revertMap() {
    return Map.fromEntries(CreateRoleValues.rolePermissions.entries
        .map((e) => MapEntry(e.value, e.key)));
  }

  static Iterable<ArgChoiceBuilder> _autocompletePokemonName(
      AutocompleteContext context) {
    print('ctx value: ${context.currentValue}');

    final names = CreateRoleValues.rolePermissions.values
        .where((e) => e.contains(context.currentValue));

    print('names: ${names.toList()}');

    final builders = names.take(25).map((e) => ArgChoiceBuilder(e, e));

    print('builders: ${builders.length}');

    return builders;
  }
}
