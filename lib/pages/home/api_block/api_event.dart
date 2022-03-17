abstract class ApiEvent{}

class ApiInitializeEvent extends ApiEvent{}

class ApiRefreshEvent extends ApiEvent{}

class ApiFindBrandEvent extends ApiEvent{
  ApiFindBrandEvent({
    required this.brandName
  });
  final String brandName;
}
