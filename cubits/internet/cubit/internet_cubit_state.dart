// Define states
abstract class InternetState {}

class InternetConnected extends InternetState {}

class InternetDisconnected extends InternetState {}

class InternetLoading extends InternetState {}