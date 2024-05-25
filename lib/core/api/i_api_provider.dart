import 'package:you_app_task/core/network/i_network_client.dart';

abstract class IApiProvider {
  final INetworkClient client;

  IApiProvider(this.client);
}
