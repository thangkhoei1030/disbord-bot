import 'core/exception/exception.dart';
import 'core/initial_bot.dart';

late final InitialBot initialBot;

ExceptionsResponse exceptionsResponse = ExceptionsResponse();

void main() {
  initialBot = InitialBot();
  initialBot.initialBot();
}
