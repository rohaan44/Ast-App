import 'package:ast_official/core/network/network_properties/network_properties.dart';
import 'package:ast_official/core/network/network_services/dio_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherService {
  static final PusherService _instance = PusherService._internal();
  factory PusherService() => _instance;
  PusherService._internal();

  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  final DioHelper _dioHelper = DioHelper();

  Future<void> init() async {
    try {
      await pusher.init(
        apiKey: '9d22939cac2e970d0d38',
        cluster: 'ap2',
        onAuthorizer: onAuthorizer,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
      );
      await pusher.connect();
    } catch (e) {
      debugPrint("Pusher Init Error: $e");
    }
  }
  Future<dynamic> onAuthorizer(
      String channelName, String socketId, dynamic options) async {
    debugPrint("Pusher Authorizing channel: $channelName");
    try {
      final response = await _dioHelper.post(
        url: "${NetworkProperties.baseUrl}chat/pusher/auth",
        isAuthRequired: true,
        requestBody: {
          'socket_id': socketId,
          'channel_name': channelName,
        },
      );
      return response;
    } catch (e) {
      debugPrint("Pusher Authorization Error: $e");
      return null;
    }
  }
  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    debugPrint(
        "Pusher Connection State changed from $previousState to $currentState");
  }
  void onError(String message, int? code, dynamic e) {
    debugPrint("Pusher Error: $message code: $code exception: $e");
  }
  void onSubscriptionSucceeded(String channelName, dynamic data) {
    debugPrint("Pusher Subscription Succeeded: $channelName data: $data");
  }
  void onEvent(PusherEvent event) {
    debugPrint(
        "Pusher Event Received: ${event.eventName} on channel ${event.channelName}");
  }
  void onSubscriptionError(String message, dynamic e) {
    debugPrint("Pusher Subscription Error: $message exception: $e");
  }
  void onDecryptionFailure(String event, String reason) {
    debugPrint("Pusher Decryption Failure: $event reason: $reason");
  }
  void onMemberAdded(String channelName, PusherMember member) {
    debugPrint("Pusher Member Added: $channelName member: $member");
  }
  void onMemberRemoved(String channelName, PusherMember member) {
    debugPrint("Pusher Member Removed: $channelName member: $member");
  }
  Future<void> subscribe(String channelName,
      {required Function(PusherEvent) onEvent}) async {
    await pusher.subscribe(
      channelName: channelName,
      onEvent: (event) {
        onEvent(event);
      },
    );
  }

  Future<void> unsubscribe(String channelName) async {
    await pusher.unsubscribe(channelName: channelName);
  }
  Future<void> trigger(PusherEvent event) async {
    await pusher.trigger(event);
  }
  Future<void> disconnect() async {
    await pusher.disconnect();
  }
}
