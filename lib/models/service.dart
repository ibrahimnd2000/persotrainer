class Service {
  final String serviceThumbnail;
  final String serviceName;
  final String serviceDesc;
  final List<String> serviceTags;
  final int servicePrice;

  Service(
      {this.serviceThumbnail,
      this.serviceName,
      this.serviceDesc,
      this.serviceTags,
      this.servicePrice});

  Service.fromJson(Map<String, dynamic> json)
      : serviceThumbnail = json['serviceThumbnail'],
        serviceName = json['serviceName'],
        serviceDesc = json['serviceDesc'],
        serviceTags = json['serviceTags'],
        servicePrice = json['servicePrice'];
}
