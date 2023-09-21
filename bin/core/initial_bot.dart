import 'dart:async';
import 'package:nyxx/nyxx.dart';
import '../values/string.dart';
import 'command/discord_command.dart';
import 'event_handle/event_handle.dart';

class InitialBot {
  static InitialBot? _instance;

  factory InitialBot() => _instance ??= InitialBot._();

  late final INyxxWebsocket bot;

  late final StreamSubscription<IReadyEvent> recivedEvent;

  final EventHandle eventHandle = EventHandle();

  InitialBot._();

  bool get checkBotAreReady => bot.ready;

  void initialBot() {
    bot = NyxxFactory.createNyxxWebsocket(
      BotStr.privateToken,
      GatewayIntents.all,
    )
      ..registerPlugin(Logging(logLevel: Level.ALL)) // Default logging plugin
      ..registerPlugin(
          CliIntegration()) // Cli integration for nyxx allows stopping application via SIGTERM and SIGKILl
      ..registerPlugin(
        IgnoreExceptions(),
      ); // Plugin that handles uncaught exceptions that may occure
    _initialSlashCommand();
  }

  void _initialSlashCommand() {
    DiscordCommand discordCommand = DiscordCommand();
    bot.registerPlugin(discordCommand.commandsPlugin);
    bot.connect();
    bot.onReady.listen((event) {
      discordCommand.initialCommand();
      bot.eventsWs.onMessageReceived.listen((event) {
        eventHandle.notifyEvent(event.message);
      });
    });
  }
}
