import 'package:nyxx/nyxx.dart';

import '../../main.dart';
import 'ping_event.dart';

class EventHandle {
  Future<void> notifyEvent(IMessage messageRequest) async {
    //check correct prefix
    if (messageRequest.content.startsWith('!')) {
      switch (messageRequest.content) {
        case "!ping":
          PingEvent(messageRequest);
          break;
        default:
          exceptionsResponse.exceptionEvent(messageRequest);
      }
    }
  }
}
