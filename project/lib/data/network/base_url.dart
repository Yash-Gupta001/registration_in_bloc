class BaseUrl {
  static const String flavor = String.fromEnvironment('FLAVOR');
  static late String baseUrl;

  static void setEnvironment(String environmentKey) {
    switch (environmentKey) {
      case 'Dev':
        baseUrl = getBaseUrl[flavor]!['uatUrl']!;
        break;
      case 'Test':
        baseUrl = getBaseUrl[flavor]!['uatUrl']!;
        break;
      case 'Prod':
        baseUrl = getBaseUrl[flavor]!['liveUrl']!;
        break;
      default:
        baseUrl = getBaseUrl[flavor]!['liveUrl']!;
        break;
    }
  }

  static Map<String, Map<String, String>> getBaseUrl = {
    'rfccc': {
      'liveUrl': "",
      'uatUrl': "",
    },
    'hits': {
      'liveUrl': "",
      'uatUrl': "https://muathitsapi.hindustanuniv.ac.in/api/v2/",
    },
    'pu': {
      'liveUrl': "",
      'uatUrl': "https://mapiuat.stjosephs.ac.in/api/v2/",
    },
  };
}
