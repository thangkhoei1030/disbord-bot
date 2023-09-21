import 'package:nyxx/nyxx.dart';

abstract class BaseEventHanlde {
  final IMessage messageRequest;
  BaseEventHanlde(this.messageRequest) {
    excute();
  }
  void excute();
}
