import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:persotrainer/models/responses/transactionResponse.dart';
import 'package:persotrainer/services/converter/jsonToType_converter.dart';
import 'package:persotrainer/utils/const.dart';

part 'escrow_service.chopper.dart';

@ChopperApi(baseUrl: 'https://api.escrow.com/2017-09-01')
abstract class EscrowService extends ChopperService {
  @Post(path: '/customer')
  Future<Response> createCustomer(
    @Body() Map<String, dynamic> body,
  );

  @Post(path: '/transaction')
  Future<Response<TransactionResponse>> createTransaction(
    @Body() Map<String, dynamic> body,
  );

  @Patch(path: '/{id}')
  Future<Response> agreeToTransaction(
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );

  @Get(path: '/{id}/payment_methods')
  Future<Response> getPaymentMethods(
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );

  @Post(path: '/{id}/payment_methods/paypal')
  Future<Response> payViaPaypal(
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );

  @Post(path: '/{id}/payment_methods/credit_card')
  Future<Response> payViaCreditCard(
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );

  @Get(path: '/{id}/payment_methods/wire_transfer')
  Future<Response> getWireTransferDetails(
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );

  @Post(path: '/{id}/payment_methods/wire_transfer')
  Future<Response> payViaWireTransfer(
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );

  @Patch(path: '/transaction/{id}')
  Future<Response<TransactionResponse>> cancelTransaction(
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );

  static EscrowService create() {
    final client = ChopperClient(
        baseUrl: baseUrl,
        services: [_$EscrowService()],
        interceptors: [
          HeadersInterceptor({
            'Content-Type': 'application/json',
            'Authorization':
                'Basic aWJyYWhpbW5kMjAwMEBnbWFpbC5jb206QElicmFoaW0xNzM4'
          }),
          HttpLoggingInterceptor(),
        ],
        converter: JsonToTypeConverter({
          TransactionResponse: (jsonData) =>
              TransactionResponse.fromJson(jsonData)
        }));

    return _$EscrowService(client);
  }
}
