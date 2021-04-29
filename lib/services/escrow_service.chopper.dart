// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$EscrowService extends EscrowService {
  _$EscrowService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = EscrowService;

  Future<Response> createCustomer(Map<String, dynamic> body) {
    final $url = 'https://api.escrow.com/2017-09-01/customer';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response<TransactionResponse>> createTransaction(
      Map<String, dynamic> body) {
    final $url = 'https://api.escrow.com/2017-09-01/transaction';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<TransactionResponse, TransactionResponse>($request);
  }

  Future<Response> agreeToTransaction(int id, Map<String, dynamic> body) {
    final $url = 'https://api.escrow.com/2017-09-01/${id}';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getPaymentMethods(int id, Map<String, dynamic> body) {
    final $url = 'https://api.escrow.com/2017-09-01/${id}/payment_methods';
    final $body = body;
    final $request = Request('GET', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> payViaPaypal(int id, Map<String, dynamic> body) {
    final $url =
        'https://api.escrow.com/2017-09-01/${id}/payment_methods/paypal';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> payViaCreditCard(int id, Map<String, dynamic> body) {
    final $url =
        'https://api.escrow.com/2017-09-01/${id}/payment_methods/credit_card';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getWireTransferDetails(int id, Map<String, dynamic> body) {
    final $url =
        'https://api.escrow.com/2017-09-01/${id}/payment_methods/wire_transfer';
    final $body = body;
    final $request = Request('GET', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> payViaWireTransfer(int id, Map<String, dynamic> body) {
    final $url =
        'https://api.escrow.com/2017-09-01/${id}/payment_methods/wire_transfer';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response<TransactionResponse>> cancelTransaction(
      int id, Map<String, dynamic> body) {
    final $url = 'https://api.escrow.com/2017-09-01/transaction/${id}';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<TransactionResponse, TransactionResponse>($request);
  }
}
