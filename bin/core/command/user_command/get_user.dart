import 'package:nyxx/nyxx.dart';
class UserSingleTon {
  static UserSingleTon? _instance;

  factory UserSingleTon() => _instance ??= UserSingleTon._();

  UserSingleTon._();
  // Returns user that can be banned from message. Parses mention or raw id from message
  SnowflakeEntity getUser(IMessage message) {
    // If mentions are not empty return first mention
    if (message.mentions.isNotEmpty) {
      return message.mentions.first.id.toSnowflakeEntity();
    }

    // Otherwise split message by spaces then take last part and parse it to snowflake and return as Snowflake entity
    return SnowflakeEntity(message.content.split(" ").last.toSnowflake());
  }
}
